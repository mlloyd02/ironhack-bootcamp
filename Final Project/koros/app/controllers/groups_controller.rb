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

	def update
		group = Group.find_by_id(params[:id])
		group.users.push(current_user)
		redirect_to groups_path 
	end

	def destroy
		group = Group.find_by_id(params[:id])
		group.users.destroy(current_user)

		if group.users.empty?
      group.destroy
    end

		redirect_to groups_path
	end

	def group_params
		params.require(:group).permit(:name, :unique_name)
	end

end
