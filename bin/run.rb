require_relative '../config/environment'
require 'faker'

# this is where our actual application will run, 
# but it'll just be calling code in other places

#thanksgivings = [brooklyn, new_brunswicks, queens, manhattan, s_i]
prompt = TTY::Prompt.new
puts "hello world"

intro
tg_choice = prompt.select("Which feast are you thinking of hitting?", Thanksgiving.all.map{|tg| tg.location})






# binding.pry
