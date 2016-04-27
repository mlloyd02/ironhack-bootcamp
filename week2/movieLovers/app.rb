require 'sinatra'
require 'sinatra/reloader'

require_relative "./model/movie_lovers.rb"

get "/" do
	erb(:search)		
end

post "/posters" do
	name = params[:search]
	@posters = Search.new(name).find_movies
	erb(:posters)
end

