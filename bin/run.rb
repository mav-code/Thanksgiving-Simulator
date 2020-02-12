require_relative '../config/environment'
require 'faker'

# this is where our actual application will run, 
# but it'll just be calling code in other places
prompt = TTY::Prompt.new
puts "hello world"

intro
thanksgiving_menu