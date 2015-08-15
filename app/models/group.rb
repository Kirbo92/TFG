class Group < ActiveRecord::Base
	has_many :memberships
	has_many :users, :through => :memberships

	has_many :tags
	has_many :posts, :through => :tags

  	mount_uploader :logo, LogoUploader


	# def posts
	# 	group_ids = 'SELECT group_id FROM memberships
 	#                     WHERE  user_id = :user_id'

 	#   	 	Post.where("content LIKE ?", "%#{self.tag}%")
 	#  	end
  	
end
