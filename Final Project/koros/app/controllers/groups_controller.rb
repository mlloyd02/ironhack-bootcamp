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
	end

	def group_params
		params.require(:group).permit(:name)
	end

end
