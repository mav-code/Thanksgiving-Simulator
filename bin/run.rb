require_relative '../config/environment'
require 'faker'

# this is where our actual application will run, 
# but it'll just be calling code in other places
arrayoffiverandomlygeneratedthanksgivings = ["placeholder1", "placeholder2", "placeholder3", "placeholder4", "placeholder5"]
prompt = TTY::Prompt.new
puts "hello world"

intro
tg_choice = prompt.select("Which feast are you thinking of hitting?", arrayoffiverandomlygeneratedthanksgivings)





# binding.pry
