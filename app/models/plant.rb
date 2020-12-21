class Plant < ApplicationRecord
    belongs_to :order
    accepts_nested_attributes_for :order
    has_many :comments
end
