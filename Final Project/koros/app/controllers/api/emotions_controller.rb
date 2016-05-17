class Api::EmotionsController < ApplicationController

	def index
		my_emotions = current_user.emotions.all
		render json: my_emotions
	end

	

end
