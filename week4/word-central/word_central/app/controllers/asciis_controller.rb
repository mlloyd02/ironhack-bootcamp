class AsciisController < ApplicationController

	def new
	end

	def create
		a = Artii::Base.new :font => 'alligator'
		@cool = a.asciify(params[:asciis][:user_text])
		render "results"
	end

end
