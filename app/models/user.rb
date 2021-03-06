class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  before_save { self.email = email.downcase }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 80 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 80 }
  validates :password, presence: true, length: { minimum: 8 }

  mount_uploader :avatar, AvatarUploader

  has_many :posts, dependent: :destroy

  has_many :memberships
  has_many :groups, :through => :memberships
  
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
                                  
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  def timeline
    following_ids = 'SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id'

    groups = 'SELECT group_id FROM memberships
             WHERE user_id = :user_id'

    group_ids = "SELECT post_id FROM tags
                      WHERE group_id IN (#{groups})"
    

    Post.where("user_id IN (#{following_ids}) OR user_id = :user_id OR id IN (#{group_ids})",
                    following_ids: following_ids, user_id: id, group_ids: group_ids)

  end

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  # Subscribe a group
  def subscribe(group)
    memberships.create(group_id: group.id)
  end

  # Unsubscribe a group
  def unsubscribe(group)
    memberships.find_by(group_id: group.id).destroy
  end

  def member?(group)
    groups.include?(group)
  end                   


end
