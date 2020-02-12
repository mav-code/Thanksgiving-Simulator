require_relative '../config/environment'
require 'faker'

# jemy = Person.create(name: 'Jemy', hunger: 8, tryptophan: 10, politics: 'blue')
Person.create(name: Faker::Name.name, hunger: 10, tryptophan: 10, politics: "Red")
Person.create(name: Faker::Name.name, hunger: 10, tryptophan: 10, politics: "Blue")
Person.create(name: Faker::Name.name, hunger: 10, tryptophan: 10, politics: "Blue")
Person.create(name: Faker::Name.name, hunger: 10, tryptophan: 10, politics: "Red")
Person.create(name: Faker::Name.name, hunger: 10, tryptophan: 10, politics: "Red")
Person.create(name: Faker::Name.name, hunger: 10, tryptophan: 10, politics: "Blue")

brooklyn = Thanksgiving.create!(type: "Turkey", strife: 0, location: "Brooklyn")
new_brunswick = Thanksgiving.create!(type: "Tofukey", strife: 0, location: "New Brunswick")
queens = Thanksgiving.create!(type: "Turkey", strife: 0, location: "Queens")
bronx = Thanksgiving.create!(type: "Tofukey", strife: 0, location: "Bronx")
s_i = Thanksgiving.create!(type: "Tofukey", strife: 0, location: "Staten Island")