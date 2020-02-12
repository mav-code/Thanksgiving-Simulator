require_relative '../config/environment'
require 'faker'

# jemy = Person.create(name: 'Jemy', hunger: 8, tryptophan: 10, politics: 'blue')
Person.create(name: Faker::Name.name, hunger: 10, tryptophan: 10, politics: "Red")
Person.create(name: Faker::Name.name, hunger: 10, tryptophan: 10, politics: "Blue")
Person.create(name: Faker::Name.name, hunger: 10, tryptophan: 10, politics: "Blue")
Person.create(name: Faker::Name.name, hunger: 10, tryptophan: 10, politics: "Red")
Person.create(name: Faker::Name.name, hunger: 10, tryptophan: 10, politics: "Red")
Person.create(name: Faker::Name.name, hunger: 10, tryptophan: 10, politics: "Blue")

brooklyn = Thanksgiving.create!(course: "Turkey", strife: 0, location: "Brooklyn")
new_brunswick = Thanksgiving.create!(course: "Tofukey", strife: 0, location: "New Brunswick")
queens = Thanksgiving.create!(course: "Turkey", strife: 0, location: "Queens")
bronx = Thanksgiving.create!(course: "Tofukey", strife: 0, location: "Bronx")
s_i = Thanksgiving.create!(cours: "Tofukey", strife: 0, location: "Staten Island")