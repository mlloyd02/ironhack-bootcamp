# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
clark = User.create(email: 'clark@ironhack.com', password: 'ironhack1', password_confirmation:'ironhack1')
tim = User.create(email: 'tim@ironhack.com', password: 'ironhack1', password_confirmation:'ironhack1')
bob = User.create(email: 'bob@ironhack.com', password: 'ironhack1', password_confirmation:'ironhack1')
sally = User.create(email: 'sally@ironhack.com', password: 'ironhack1', password_confirmation:'ironhack1')
frank = User.create(email: 'frank@ironhack.com', password: 'ironhack1', password_confirmation:'ironhack1')
denise = User.create(email: 'denise@ironhack.com', password: 'ironhack1', password_confirmation:'ironhack1')

clark.emotions.create(valence: 0.25, arousal: 0.25)