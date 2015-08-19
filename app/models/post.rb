class Post < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :group

  has_many :tags, dependent: :destroy
  has_many :groups, :through => :tags

  validates :content, length: { maximum: 140 }, presence: true

  after_create :set_tags

  def set_tags

  	hastags = self.content.scan(/#\w+/).flatten
  	
  	unless hastags.blank?
      hastags = hastags.map {|str| "\'#{str}\'"}.join(', ')
      groups = Group.where("tag in (#{hastags}) ")
	    
	  	groups.each do |group|
        Tag.create(post_id: self.id, group_id: group.id)
	  	end
  	end
  end
  
end
