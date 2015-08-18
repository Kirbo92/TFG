class Group < ActiveRecord::Base

  	validates :tag, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
  	validates :name, presence: true, length: { maximum: 100 }
  	validates :user_admin, presence: true



	has_many :memberships
	has_many :users, :through => :memberships

	has_many :tags
	has_many :posts, :through => :tags

  	mount_uploader :logo, LogoUploader

  	
end
