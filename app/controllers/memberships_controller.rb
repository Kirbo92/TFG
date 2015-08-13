class MembershipsController < ApplicationController
	def create
		group = Group.find params[:group_id]
		current_user.subscribe(group)
		redirect_to groups_path
	end

	def destroy
		group = Membership.find(params[:id]).group
		current_user.unsubscribe(group)
		redirect_to groups_path
	end
end
