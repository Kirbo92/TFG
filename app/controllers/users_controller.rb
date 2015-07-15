class UsersController < ApplicationController
	def show
		@user = User.find params[:id]
		@follower = Follower.find_by user_id: current_user.id, user_followed_id: @user.id
		if @follower
			return
		else
			@follower = Follower.new
		end
	end
end
