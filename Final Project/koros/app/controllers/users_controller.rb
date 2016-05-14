class UsersController < ApplicationController
	#before_action :authenticate_user!, only: :show

	def index
	end

	def show
		@groups = current_user.groups.all
	end

end
