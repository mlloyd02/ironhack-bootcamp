Concert.create artist: 'Trampled By Turtles', venue: 'First Avenue', city: 'Minneapolis', date: Date.new(2016, 5, 6), price: 8.50, description: "This is going to be awesome!" 
Concert.create artist: 'Pixies', venue: 'First Avenue', city: 'Minneapolis', date: Date.new(2016, 5, 5), price: 8.50, description: "This is going to be awesome!" 
Concert.create artist: 'Low', venue: 'First Avenue', city: 'Minneapolis', date: Date.new(2016, 5, 5), price: 8.50, description: "This is going to be awesome!" 
Concert.create artist: 'Husker Du', venue: 'First Avenue', city: 'Minneapolis', date: Date.new(2016, 5, 4), price: 8.50, description: "This is going to be awesome!" 
Concert.create artist: 'Chris Holm', venue: 'First Avenue', city: 'Minneapolis', date: Date.new(2016, 5, 4), price: 8.50, description: "This is going to be awesome!" 

clark, tony, rick = User.create!([
	{name: 'Clark Kent', email: 'clark@ironhack.com', password: 'ironhack', password_confirmation: 'ironhack'},
	{name: 'Tony Stark', email: 'tony@ironhack.com', password: 'ironhack', password_confirmation: 'ironhack'},
	{name: 'Rick Grimes', email: 'rick@ironhack.com', password: 'ironhack', password_confirmation: 'ironhack'}
])	
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
