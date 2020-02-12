class Thanksgiving < ActiveRecord::Base
   has_many :plates
   has_many :people, through: :plates

   def self.generate
      [4..10].rand.times do (Person.random_new)
      end
   end
end