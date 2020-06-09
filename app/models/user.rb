class User < ApplicationRecord
    has_many :sequences

    # has_secure_password
    # validates :username, uniqueness: true
end
