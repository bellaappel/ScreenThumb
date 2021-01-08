class Plant < ApplicationRecord
    belongs_to :order
    accepts_nested_attributes_for :order
    has_many :comments
    has_many :users, through: :comments
    validates :name, uniqueness: true 
    has_one_attached :img
    scope :order_by_name, -> { order(name: :asc) }
end
