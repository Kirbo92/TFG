class MainController < ApplicationController

	def index
		@posts = current_user.feed.order(created_at: :desc)
	end
end
