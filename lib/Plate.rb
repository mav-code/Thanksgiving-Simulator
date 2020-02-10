class Plate < ActiveRecord::Base
    belongs_to :thanksgiving
    belongs_to :person
end