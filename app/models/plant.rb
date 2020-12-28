class Plant < ApplicationRecord
    belongs_to :order
    accepts_nested_attributes_for :order
    has_many :comments
    has_many :users, through: :comments
end
