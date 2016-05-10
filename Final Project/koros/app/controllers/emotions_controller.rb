require 'pry'

class EmotionsController < ApplicationController

	def new
		redirect_to new_user_session_path unless user_signed_in?
		@emotion = Emotion.new
		@emotion.arousal ||= 0.50
		@emotion.valence ||= 0.50
	end

	def create
		@emotion = Emotion.new(emotion_params)
		@emotion.save
		redirect_to new_emotion_path
	end

	def show
		@emotions = Emotion.all
	end

	def emotion_params
		params.require(:emotion).permit(:valence, :arousal)
	end

end
