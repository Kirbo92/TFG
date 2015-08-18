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
		@group.user_admin = current_user.id  
		
		if @group.save
			return redirect_to groups_path
		end

		render :new
	end

	def edit
		@group = Group.find(params[:id])
	end

	def update
		@group = Group.find(params[:id])

		if @group.update secure_params
			return redirect_to groups_path
		end

		render 'edit'
	end

	def show
		@group = Group.find params[:id]
		@posts = @group.posts
	end

	def destroy
		@group = Group.find(params[:id])
		@group.destroy
		
		redirect_to groups_path
	end

	private
	def secure_params
		params.require(:group).permit :name, :tag, :description, :logo
	end
end
