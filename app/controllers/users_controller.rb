class UsersController < ApplicationController
	def show
		@user = User.find params[:id]
		# @follower = Follower.find_by user_id: current_user.id, user_followed_id: @user.id
		# if @follower
		# 	return
		# else
		# 	@follower = Follower.new
		# end
	# 	<% if @follower.user_id %>
	# 	<%= button_to 'Dejar de seguir', follower_path(@follower), class: 'btn btn-primary', method: :delete %>
	# <% else %>
	# 	<%= button_to 'Seguir', followers_path(	:user_id => current_user.id, 
	# 										:user_followed_id => @user.id),
	# 										class: 'btn btn-primary',
	# 										:method => :post %>
	# <% end %>
	end
end
