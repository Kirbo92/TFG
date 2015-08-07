class Follower < ActiveRecord::Base
	belongs_to :user
	belongs_to :following, :class_name => "User", foreign_key: 'user_followed_id'
end
