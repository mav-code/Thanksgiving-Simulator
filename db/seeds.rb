require_relative '../config/environment'
require 'faker'

# jemy = Person.create(name: 'Jemy', hunger: 8, tryptophan: 10, politics: 'blue')
Person.create(name: Faker::Name.name, hunger: 10, tryptophan: 10, politics: "red")