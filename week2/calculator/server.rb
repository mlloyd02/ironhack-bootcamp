require "sinatra"
require "sinatra/reloader"

# get "/add" do
#   erb(:add)
# end

get "/" do
	erb(:home_page)
end

post "/calculate" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  if params[:operation] == "addition"
  	result = first + second
	elsif params[:operation] == "subtraction"
		result = first - second
	elsif params[:operation] == "multiplication"
		result = first * second
	else
		result = first / second
	end
  "#{result}"
end

# post "/calculate_subtract" do
#   first = params[:first_number].to_f
#   second = params[:second_number].to_f
#   result = first - second
#   "#{first} + #{second} = #{result}"
# end

# post "/calculate_multiply" do
#   first = params[:first_number].to_f
#   second = params[:second_number].to_f
#   result = first * second
#   "#{first} + #{second} = #{result}"
# end

# post "/calculate_divide" do
#   first = params[:first_number].to_f
#   second = params[:second_number].to_f
#   result = first / second
#   "#{first} + #{second} = #{result}"
# end
