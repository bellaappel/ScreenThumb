class Plant < ApplicationRecord
    belongs_to :plant_type
    accepts_nested_attributes_for :plant_type, :type
end
