class UsersController < ApplicationController
	before_action :authenticate_user!, only: :show

	@user = User.new(user_params)
	if @user.save
		WelcomeMailer.welcome_email(@user).deliver_now
		redirect_to_user_path
	else
		render :new
	end



	# def show
	# 	@user = User.find(params[:id])
	# 	render 'users/show'
	# end
end
