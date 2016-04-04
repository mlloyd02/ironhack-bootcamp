class StringCalculator

	def add(string_to_add)
		total = 0
		string_to_add.to_s.split(",").each do |single_number|
			total += single_number.to_i
		end
		total
	end

end
