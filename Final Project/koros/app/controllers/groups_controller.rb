class GroupsController < ApplicationController

	def index
		@groups = Group.all
	end

	def new
		@group = Group.new
	end

	def create
		current_user.groups.create(group_params)
		redirect_to groups_path
	end

	def show
		@group = Group.find_by_id(params[:id])
		@users = @group.users.all

		emotions_month = @users.map { |user| user.emotions.limit(30) }
		emotions_week = @users.map { |user| user.emotions.limit(7) }

		valence_month = emotions_month.map { |emotion| emotion.pluck(:valence)}
		valence_week = emotions_week.map { |emotion| emotion.pluck(:valence)}

		arousal_month = emotions_month.map { |emotion| emotion.pluck(:arousal)}
		arousal_week = emotions_week.map { |emotion| emotion.pluck(:arousal)}

		@valence_averages_month = valence_month.transpose.map { |a| a.reduce(:+)/valence_month.length}
		@valence_averages_week = valence_week.transpose.map { |a| a.reduce(:+)/valence_week.length}

		@arousal_averages_month = arousal_month.transpose.map { |a| a.reduce(:+)/arousal_month.length}	
		@arousal_averages_week = arousal_week.transpose.map { |a| a.reduce(:+)/arousal_week.length}	

		@days_month = emotions_month[0].map{ |emotion| emotion.created_at.strftime('%m/%d/%y')}
		@days_week = emotions_week[0].map{ |emotion| emotion.created_at.strftime('%m/%d/%y')}

	end

	def update
		group = Group.find_by_id(params[:id])
		group.users.push(current_user)
		redirect_to groups_path 
	end

	def group_params
		params.require(:group).permit(:name)
	end

end
