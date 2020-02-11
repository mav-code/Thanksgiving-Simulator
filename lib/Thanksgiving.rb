class Thanksgiving < ActiveRecord::Base
    has_many :plates
    has_many :people through: :playes
end