class User < ApplicationRecord
    has_many :plants
    has_many :messages
    has_many :comments
    has_many :orders, through: :plants
    has_secure_password
    validates :email, uniqueness: true
    validates :username, uniqueness: true
    validates :password, length: {minimum: 4}
end
