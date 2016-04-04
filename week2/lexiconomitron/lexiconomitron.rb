class Lexiconomitron
	def eat_t input_text
		text_split = input_text.split('')
		text_no_t = text_split.map do | char |
			if char == "t" || char == "T"
				""
			else
				char
			end
		end
		text_no_t.join
	end

	def shazam input_array
		array_reversed = input_array.map do | word |
			eat_t(word.reverse)
		end
		first_last = []
		first_last << array_reversed[0]
		first_last << array_reversed[array_reversed.length - 1]
		first_last 
	end

	def oompa input_array
		short_words = []
		input_array.each do | word |
			if word.length < 4
				short_words << eat_t(word)
			end
		end
		short_words
	end

end
