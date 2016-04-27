class TextInspectionsController < ApplicationController

	def new
	end

	def create
		@text = params[:text_inspection][:user_text]
		@words = @text.split(" ")
		@word_count = @words.length
		minutes_deci = @word_count.to_f / 275.0
		@minutes = minutes_deci.round(1)
		frequencies = @words.each_with_object(Hash.new(0)) { |e, h| h[e] += 1 }
		@sorted_freqs = frequencies.sort_by(&:last).reverse.first(10).to_h
		@words_top_ten = @sorted_freqs.keys.join(", ")

    render "results"
  end

end

