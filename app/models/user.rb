class User < ApplicationRecord
    has_many :plants
    has_many :messages
    has_many :comments
    has_many :types, through: :plants
    has_secure_password
    validates :email, uniqueness: true
end
