# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Stage.delete_all
Category.delete_all

Stage.create([{name: 'In my head'}, {name: 'Written down'}, {name: 'Working on it'}, {name: 'Out in the market'}, {name: 'Shelved, collecting dust'}])

Category.create([{name: 'Message'}, {name: 'App'}, {name: 'Business'}, {name: 'Book'}, {name: 'Song'}])