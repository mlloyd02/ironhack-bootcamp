# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
clark = User.create(first_name: 'Clark', email: 'clark@ironhack.com', password: 'ironhack1', password_confirmation:'ironhack1')
tim = User.create(first_name: 'Tim', email: 'tim@ironhack.com', password: 'ironhack1', password_confirmation:'ironhack1')
bob = User.create(first_name: 'Bob', email: 'bob@ironhack.com', password: 'ironhack1', password_confirmation:'ironhack1')
sally = User.create(first_name: 'Sally', email: 'sally@ironhack.com', password: 'ironhack1', password_confirmation:'ironhack1')
frank = User.create(first_name: 'Frank', email: 'frank@ironhack.com', password: 'ironhack1', password_confirmation:'ironhack1')
denise = User.create(first_name: 'Denise', email: 'denise@ironhack.com', password: 'ironhack1', password_confirmation:'ironhack1')

# clark.emotions.create(valence: 0.25, arousal: 0.25)
 # User.find_by_id(7).emotions.create(valence: 0.25, arousal: 0.25)
# clark.emotions.create(valence: 0.5, arousal: 0.3)
# clark.emotions.create(valence: 0.25, arousal: 0.25)
# clark.emotions.create(valence: 0.5, arousal: 0.3)
# clark.emotions.create(valence: 0.25, arousal: 0.25)
# clark.emotions.create(valence: 0.5, arousal: 0.3)
# clark.emotions.create(valence: 0.25, arousal: 0.25)
# clark.emotions.create(valence: 0.5, arousal: 0.3)
# clark.emotions.create(valence: 0.25, arousal: 0.25)
# clark.emotions.create(valence: 0.5, arousal: 0.3)

school = clark.groups.create(name: 'Ironhack')
church = clark.groups.create(name: 'Church')
work = clark.groups.create(name: 'Work')

# tim << church
# sally << school
# frank << school
# denise << school

# User.all << Student.create(...)