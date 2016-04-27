

class ConcertsController < ApplicationController

	def index
		@concerts_today = Concert.where("date == ?", Date.today)
		@concerts_this_month = Concert.where("date >= ? AND date <= ?", Date.today, Date.today.end_of_month)
		
	end

	def show
		@my_concert = Concert.find_by(id: params[:id])
		# @my_comments = @my_concert.comments.new
    unless @my_concert
      render "no_concerts_found"
    end
	end

	def new
		@my_concert = Concert.new
	end

	def create
		@my_concert = Concert.new concert_params
		@my_concert.save

		redirect_to("/concerts/#{@my_concert.id}")
	end

	private
	def concert_params
		params.require(:concert).permit(:artist, :venue, :city, :date, :price, :description)
	end

end
