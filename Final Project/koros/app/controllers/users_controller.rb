class UsersController < ApplicationController
	#before_action :authenticate_user!, only: :show

	def index

		@groups = current_user.groups.all

		unless current_user.emotions.empty? 

			@valences_month = current_user.valences 30
			@valences_week = current_user.valences 7

			@arousals_month = current_user.arousals 30
			@arousals_week = current_user.arousals 7
			
			@days_month = current_user.format_days 30
			@days_week = current_user.format_days 7

		end
	end

	def show
	end

end
