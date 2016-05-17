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
		
		@valence_averages_month = @group.valence_avg 30
		@valence_averages_week = @group.valence_avg 7

		@arousal_averages_month = @group.arousal_avg 30	
		@arousal_averages_week = @group.valence_avg 7

		@days_month = @group.format_days 30
		@days_week = @group.format_days 7

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
