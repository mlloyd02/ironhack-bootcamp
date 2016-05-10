class ReviewsController < ApplicationController

	def create
		@my_review = Review.new(
			:description => params[:review][:description])
		@my_reviews.save

		redirect_to '/index'
	end

end