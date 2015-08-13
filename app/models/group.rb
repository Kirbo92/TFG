class Group < ActiveRecord::Base
	has_many :memberships
	has_many :users, :through => :memberships
	has_many :posts

	def posts
   	 	Post.where("content LIKE ?", "%#{self.tag}%")
  	end
  	
end
