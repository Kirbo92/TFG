class GroupsController < ApplicationController
	def index
		@groups = Group.all
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.new secure_params
		@group.tag = '#' +  @group.tag
		
		if @group.save
			return redirect_to groups_path
		end

		render :new
	end

	def show
		group = Group.find params[:id]
		@posts = group.posts
	end

	private
	def secure_params
		params.require(:group).permit :name, :tag, :description
	end
end
