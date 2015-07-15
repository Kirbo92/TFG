class FollowersController < ApplicationController
	def create
		@follower = Follower.new secure_params
		
		if @follower.save
			redirect_to :back
		end
	end

	def destroy
		@follower = Follower.find params[:id] 
		if @follower.destroy
			redirect_to :back
		end
	end

	private
	def secure_params
		params.require(:follower).permit :user_id, :user_followed_id
	end
end