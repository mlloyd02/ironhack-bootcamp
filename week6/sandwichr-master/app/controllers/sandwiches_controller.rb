require 'pry'

class SandwichesController < ApplicationController
	def index
	  sandwiches = Sandwich.all
	  render json: sandwiches
	end

	def create
	  sandwich = Sandwich.create(sandwich_params)
	  render json: sandwich
	end

	def show
	  sandwich = Sandwich.find_by(id: params[:id])
	  unless sandwich
	    render json: {error: "sandwich not found"},
	    status: 404
	    return
	  end
		# sandwich[:ingredients] = sandwich.ingredients.all
		sandwichPlusIngredients = {:sandwich => sandwich, :ingredients => sandwich.ingredients.all}
	  render json: sandwichPlusIngredients
	end

	def update
	  sandwich = Sandwich.find_by(id: params[:id])
	  unless sandwich
	    render json: {error: "sandwich not found"},
	    status: 404
	    return
	  end
	  sandwich.update(sandwich_params)
	  render json: sandwich
	end

	def destroy
	  sandwich = Sandwich.find_by(id: params[:id])
	  unless sandwich
	    render json: {error: "sandwich not found"},
	    status: 404
	    return
	  end
	  sandwich.destroy
	  render json: sandwich
	end
	def add_ingredient
		sandwich = Sandwich.find_by(id: params[:id])
		ingredient = Ingredient.find_by(id: params[:ingredient][:id])
		sandwich.ingredients.push(ingredient)
		sandwich.save
		sandwichPlusIngredients = {:sandwich => sandwich, :ingredients => sandwich.ingredients.all}
		render json: sandwichPlusIngredients
	end

	private

	# def ingredient_params
	# 	params.require(:ingredient).permit(:id)
	# end

	def sandwich_params
	  params.require(:sandwich)
	    .permit(:name, :bread_type)
	end
end
