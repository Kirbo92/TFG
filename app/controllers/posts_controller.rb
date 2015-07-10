class PostsController < ApplicationController
	
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new secure_params
		
		if @post.save
			return redirect_to posts_path
		end

		render 'new'
	end


	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update secure_params
			return redirect_to posts_path
		end

		render 'edit'
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		
		redirect_to posts_path
	end

	private
	def secure_params
		params.require(:post).permit :content
	end

end