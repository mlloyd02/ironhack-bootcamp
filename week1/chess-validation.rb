require 'pry'

class Board 
	attr_reader :board, :black_pieces, :white_pieces

	def initialize file
		@white_pieces = [:wR, :wN, :wB, :wQ, :wK, :wP]
		@black_pieces = [:bR, :bN, :bB, :bQ, :bK, :bP]

		board_empty = Array.new(64) { Array.new(2) }
		positions = board_empty.each_with_index do |a, i|
			board_empty[i][0] = i % 8
			board_empty[i][1] = i/8.floor
		end

		file_board = IO.read(file)
		pieces_str = file_board.split(/[\n ]+/)
		pieces = pieces_str.map do |a|
			if a == "--"
				nil
			else 
				a.to_sym
			end
		end

		@board = Hash[positions.zip pieces]
	end 

	def status position
		@board[position]
	end

end

class Piece

	def initialize board, origin, destination
		@origin = origin
		@destination = destination
		@board = board
	end

	def vertical_horizontal_movement
		@origin[0] == @destination[0] || @origin[1] == @destination[1]
	end

	def diagonal_movement
		(@destination[1] - @origin[1]).abs == (@destination[0] - @origin[0]).abs
	end

	def stepwise_movement
		(@destination[0] - @origin[0]).abs == 1 || (@destination[1] - @origin[1]).abs == 1
	end

	# def validate_obstruction
	# 	destination_piece = @board.status(@destination)
	# 	origin_piece = @board.status(@origin)
	# 	if @board.white_pieces.include? destination_piece 
	# 		destination_color = "white"
	# 	else
	# 		destination_color = "black"
	# 	end
	# 	if @board.white_pieces.include? origin_piece
	# 		origin_color = "white"
	# 	else
	# 		origin_color = "black"
	# 	end
	# end

end


board = Board.new("simple_board.txt")
puts Piece.new(board, [0,0], [0,1]).validate_obstruction

class Rook < Piece
	def validate
		vertical_horizontal_movement	
	end
end

puts Rook

class Queen < Piece
	def validate 
		vertical_horizontal_movement || diagonal_movement
	end
end

class Knight < Piece
	def validate
		(@destination[0] - @origin[0]).abs == 2 && (@destination[1] - @origin[1]).abs == 1 || 
		(@destination[0] - @origin[0]).abs == 1 && (@destination[1] - @origin[1]).abs == 2
	end
end

class Bishop < Piece
	def validate
		diagonal_movement
	end
end

class King < Piece
	def validate
		(diagonal_movement || vertical_horizontal_movement) && stepwise_movement
	end
end

class Pawn < Piece
	def validate
		(diagonal_movement || vertical_horizontal_movement) && stepwise_movement
	end
end

class ChessValidator
	def initialize board_file, moves_file
		@board_file = board_file
		@moves_file = IO.read(moves_file)
		@board = Board.new(@board_file)
	end

	def alg_to_coordinate alg
		letter_to_num = {a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7}
		alg_split = alg.split('')
		alg_split_letter = alg_split[0].to_sym
		alg_split_xval = letter_to_num[alg_split_letter] 
		alg_split_yval = 8 - alg_split[1].to_i 
		coordinate = [alg_split_xval, alg_split_yval]
	end

	def validate_moves
		all_pieces = @board.white_pieces + @board.black_pieces

		positions_alg = @moves_file.split
		paired_moves_alg = positions_alg.each_slice(2).to_a
		move_coordinates = paired_moves_alg.map do | pair |
			[alg_to_coordinate(pair[0]), alg_to_coordinate(pair[1])]
		end
		origin_pieces = move_coordinates.map do |move|
			@board.status(move[0])
		end
		all_pieces
	end

end

# puts ChessValidator.new("simple_board.txt", "simple_moves.txt").validate_moves

