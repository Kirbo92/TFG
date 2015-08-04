class FollowersController < ApplicationController
	def create
	  @follower = current_user.followers.build(	:user_id => params[:user_id], 
	  											:user_followed_id => params[:user_followed_id])
	  if @follower.save
	    redirect_to :back
	  else
	    redirect_to root_url
	  end
	end

	def destroy
	  @follower = current_user.followers.find(params[:id])
	  @follower.destroy
	  redirect_to :back
	end

	private
	def secure_params
		params.require(:follower).permit :user_id, :user_followed_id
	end
end