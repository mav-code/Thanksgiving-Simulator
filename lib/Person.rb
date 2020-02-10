class Person < ActiveRecord::Base
    has_many :plates
    has_many :thanksgivings through: :plates
end