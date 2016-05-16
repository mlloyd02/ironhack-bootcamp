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

for i in 0..30
  emo = clark.emotions.create(valence: rand(), arousal: rand())
  emo.created_at = i.days.ago
  emo.save
end

for i in 0..30
  emo = tim.emotions.create(valence: rand(), arousal: rand())
  emo.created_at = i.days.ago
  emo.save
end

for i in 0..30
  emo = bob.emotions.create(valence: rand(), arousal: rand())
  emo.created_at = i.days.ago
  emo.save
end

for i in 0..30
  emo = sally.emotions.create(valence: rand(), arousal: rand())
  emo.created_at = i.days.ago
  emo.save
end

for i in 0..30
  emo = denise.emotions.create(valence: rand(), arousal: rand())
  emo.created_at = i.days.ago
  emo.save
end

school = clark.groups.create(name: 'Ironhack')
church = clark.groups.create(name: 'Church')
work = clark.groups.create(name: 'Work')

school.users.push(tim)
school.users.push(bob)
school.users.push(sally)
school.users.push(denise)

