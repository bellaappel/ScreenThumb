class Plant < ApplicationRecord
    belongs_to :order
    accepts_nested_attributes_for :order
end
