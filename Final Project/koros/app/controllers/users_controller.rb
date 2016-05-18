class UsersController < ApplicationController
	#before_action :authenticate_user!, only: :show

	def index

		@groups = current_user.groups.all

		unless current_user.emotions.empty? 
		end
		
	end

	def show
	end

end
