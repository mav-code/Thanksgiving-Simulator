require_relative '../config/environment'
require 'faker'

# this is where our actual application will run, 
# but it'll just be calling code in other places
puts "hello world"
prompt = TTY::Prompt.new
user = Person.new(name: "user", hunger: "100", tryptophan: "0", politics: nil)

intro
thanksgiving_menu