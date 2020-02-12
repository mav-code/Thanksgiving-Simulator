require_relative '../config/environment'
require 'faker'

# this is where our actual application will run, 
# but it'll just be calling code in other places
prompt = TTY::Prompt.new
puts "hello world"

# intro

# tg_choice = prompt.select("Which feast are you thinking of hitting?", Thanksgiving.all.map{|tg| tg.location})
# current_tg = Thanksgiving.find_by location tg_choice.to_s
# puts "#{tg_choice}"

test = Person.random_new
test = Thankgiving.generate

binding.pry
