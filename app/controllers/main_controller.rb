class MainController < ApplicationController
	before_action :authenticate_user!

	def index
		@posts = current_user.feed.order(created_at: :desc)
	end
end
