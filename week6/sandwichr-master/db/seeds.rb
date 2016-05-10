# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Sandwich.create(name: 'Bikini', bread_type: 'wheat bread')
Sandwich.create(name: 'Bocadillo', bread_type: 'french bread')
Sandwich.create(name: 'Falafel', bread_type: 'pita bread')
Ingredient.create(name: 'ham', calories: '50')
Ingredient.create(name: 'bacon', calories: '100')
Ingredient.create(name: 'tomato', calories: '30')
