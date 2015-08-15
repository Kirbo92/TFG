class PostsController < ApplicationController

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create

		@post = Post.new secure_params
		@post.user = current_user
		
		if @post.save
			return redirect_to root_path, :flash => { :success => t('.created', model: @post.class.model_name.human)}
		end

		render :new
	end


	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update secure_params
			return redirect_to root_path, :flash => { :success => t('.edited', model: @post.class.model_name.human) }
		end

		render 'edit'
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		
		redirect_to root_path, notice: t('.destroyed', model: @post.class.model_name.human)
	end

	private
	def secure_params
		params.require(:post).permit :content, :group_id
	end

end