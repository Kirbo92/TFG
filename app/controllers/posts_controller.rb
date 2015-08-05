class PostsController < ApplicationController

	before_action :authenticate_user!

	def index
		@posts = Post.find_by_sql("SELECT p.id, p.content, p.created_at, p.updated_at, p.user_id
									FROM posts AS p
									RIGHT JOIN followers AS f
 									ON p.user_id = f.user_followed_id
									WHERE f.user_id = '#{current_user.id}'
									UNION
									SELECT p.id, p.content, p.created_at, p.updated_at, p.user_id
									FROM posts as p
									WHERE p.user_id = '#{current_user.id}'
									ORDER BY created_at DESC")
	
		# posts_followers = Post.joins("RIGHT JOIN followers ON posts.user_id = followers.user_followed_id
		# 								where followers.user_id = #{current_user.id}")	
		# posts_user = Post.where(user_id: current_user.id)
		# @posts = posts_followers + posts_user
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