class PostsController < ApplicationController

	before_action :authenticate_user!

	def index
		# @posts = Followers.joins('LEFT JOIN posts ON posts.user_id = followers.user_followed_id', 
		# 	followers.user_id = current_user.id)
		@posts = Post.order(created_at: :desc)
	end

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
			return redirect_to root_path, notice: t('.created', model: @post.class.model_name.human)
		end

		render :new
	end


	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update secure_params
			return redirect_to root_path, notice: t('.edited', model: @post.class.model_name.human)
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
		params.require(:post).permit :content
	end

end