class Person < ActiveRecord::Base
    has_many :plates
    has_many :thanksgivings, through: :plates

    # def self.random_new
    #     new = Person.create
    #     new.name = Faker::Name.name
    #     new
    # end
end