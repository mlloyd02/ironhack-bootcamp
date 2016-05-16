class UsersController < ApplicationController
	#before_action :authenticate_user!, only: :show

	def index
		@groups = current_user.groups.all
		emotions_month = current_user.emotions.limit(30)
		emotions_week = current_user.emotions.limit(7)

		@valences_month = emotions_month.pluck(:valence).reverse
		@arousals_month = emotions_month.pluck(:arousal).reverse
		days_month = emotions_month.map{ |emotion| emotion.created_at.strftime('%m/%d/%y')}
		@days_month = days_month.reverse

		@valences_week = emotions_week.pluck(:valence).reverse
		@arousals_week = emotions_week.pluck(:arousal).reverse
		days_week = emotions_week.map{ |emotion| emotion.created_at.strftime('%m/%d/%y')}
		@days_week = days_week.reverse

		@valences_month_avg = (@valences_month.reduce(:+)/@valences_month.length).round(2)
		@arousals_month_avg = (@arousals_month.reduce(:+)/@arousals_month.length).round(2)
		@valences_week_avg = (@valences_week.reduce(:+)/@valences_week.length).round(2)
		@arousals_week_avg = (@arousals_week.reduce(:+)/@arousals_week.length).round(2)
	end

	def show
	end

end
