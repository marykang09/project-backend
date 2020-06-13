class UserQuote < ApplicationRecord
    belongs_to :user 
    belongs_to :quote
end
