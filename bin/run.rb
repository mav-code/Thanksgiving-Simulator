require_relative '../config/environment'

# this is where our actual application will run, 
# but it'll just be calling code in other places



puts "hello world"

puts Person.all.first.name

binding.pry
