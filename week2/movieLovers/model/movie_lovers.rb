require 'imdb'
require 'pry'

class Search
	def initialize name
		@name = name
		@movies = []
		@posters = []
	end

	def find_movies 
		movie_objects = Imdb::Search.new(@name)[0..100].movies
		i = 0
		while @movies.length < 9
			if movie_objects[i].poster != nil 
				@movies << movie_objects[i].poster
			end
			i += 1
		end
		@movies
	end

end
