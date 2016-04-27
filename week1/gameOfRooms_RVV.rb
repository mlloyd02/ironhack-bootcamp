# ===================================================================================================== #
#    ________                                       _____  __________                                	#
#   /  _____/_____    _____   ____   ______   _____/ ____\ \______   \ ____   ____   _____   ______     #
#  /   \  ___\__  \  /     \_/ __ \ /  ___/  /  _ \   __\   |       _//  _ \ /  _ \ /     \ /  ___/     #
#  \    \_\  \/ __ \|  Y Y  \  ___/ \___ \  (  <_> )  |     |    |   (  <_> |  <_> )  Y Y  \\___ \      #
#   \______  (____  /__|_|  /\___  >____  >  \____/|__|     |____|_  /\____/ \____/|__|_|  /____  >     #
#          \/     \/      \/     \/     \/                         \/                    \/     \/      #
# ===================================================================================================== #

class Game
	attr_accessor :current_room, :character, :last_room, :go_to_next_room

	def initialize
		@character = Character.new "Drunk"
		@go_to_next_room = true
		self.init_game
	end

	def create_room
		Room.new
	end

	def init_game
		puts "Hi #{@character.name}. Welcome to Game of Rooms: adventure at Ironhack"
		
		while @character.lifes > 0 do
			if @go_to_next_room
				@current_room = self.create_room
				@go_to_next_room = false
			else
				puts @current_room.path.get_path_text
				puts "There´s a #{@current_room.selected_item} on the floor"
				puts "You can go to: "
				@current_room.valid_directions.each{|direction| print direction+" "}
				puts ""
				print "Direction >"

				evaluate_character_action @character.move
			end
		end

	end

	def evaluate_character_action character_selection
		if character_selection == "pick"
			@character.get_object @current_room.selected_item
		elsif character_selection == "drop"
			@character.drop_first_object
		else
			evaluate_room character_selection
		end	
	end
	
	def evaluate_room user_response
		
			@character_direction = @current_room.evaluate_character_direction user_response
			
			if @character_direction
				@current_room.path.get_path_success
				@go_to_next_room = true
			else
				if @character.lifes > 1 
					@character.lose_a_life
				else 
					@character.lose_a_life
					puts(@current_room.path.get_path_fail)
				end
			end
	end
end

class Room
	attr_accessor :valid_directions, :path, :correct_direction, :items, :selected_item

	def initialize
		@path = Path.new
		@items = ["Orc´s head", "Blade", "Teletubbie", "Bottle of Water"]
		@selected_item = found_item
		@valid_directions = []
		self.create_valid_directions
		@correct_direction = select_correct_direction
	end

	def create_valid_directions
		["N","S","E","W"].each do |direction|
			if rand(2) == 1
				@valid_directions << direction
			end
		end

		if !@valid_directions
			@valid_directions << "N"
		end
	end

	def found_item
		@selected_item = @items[rand(@items.length)]
	end

	def select_correct_direction
		@correct_direction = @valid_directions[rand(@valid_directions.length - 1)]
	end

	def evaluate_character_direction character_selection
		@correct_direction.downcase == character_selection.downcase
	end
end

class Path
	attr_accessor :selected_path, :paths_text, :paths_success, :paths_fails

	def initialize
		@paths_text = [
			"There´s a bear on this room, he´s gonna kill you if you don´t escape!",
			"You find a sleeping dragon in the middle of the way, take care of the tail!",
			"Strangely, there is only an old television with a grey screen. Nothing to worry about.",
			"A light in the middle of the room is all you can see, like a pilar of fire." ]
		@paths_success = [
			"You could escape successfully!",
			"Silently, you left the room...",
			"You pass through the door without troubles",
			"You barely can see anything, but finally get the right way."
		]
		@paths_fails = [
			"The bear hits you and, with his incredible bite, tear you apart.",
			"The dragon awakes and kills you with his infernal flame.",
			"The girl of the Ring came from the television and eat your soul.",
			"The light turns red and explode, blowing you in a thousand pieces."
		]

		@selected_path = rand 4
	end
	
	def get_path_text
		@paths_text[@selected_path]
	end

	def get_path_success
		@paths_success[@selected_path]
	end

	def get_path_fail
		@paths_fails[@selected_path]
	end
end

class Character
	attr_accessor :name, :lifes, :response, :bag

	def initialize name
		@name = name
		@lifes = 3
		@bag = []
	end

	def move
		@response = gets.chomp
	end

	def lose_a_life
		@lifes -= 1
	end

	def get_object object
		puts "You get the #{object}"
		@bag << object
	end

	def drop_first_object
		puts "You dropped a #{@bag.first}"
		@bag.shift
	end
end

gameOfRooms = Game.new