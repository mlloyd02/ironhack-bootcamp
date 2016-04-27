def class Calculator
	def initialize first_number second_number
		@first_number = first_number
		@second_number = second_number
	end

	def add
		@first_number + @second_number
	end

	def subtract
		@first_number - @second_number
	end

	def multiply
		@first_number * @second_number
	end

	def divide
		@first_number / @second_number
	end

end