class User < ApplicationRecord
    has_many :sequences
    has_many :user_quotes
    has_many :quotes, through: :user_quotes
    has_secure_password
    validates :username, uniqueness: true
end
