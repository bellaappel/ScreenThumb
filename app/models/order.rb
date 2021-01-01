class Order < ApplicationRecord
    has_many :plants
    validates :order, uniqueness: true
end
