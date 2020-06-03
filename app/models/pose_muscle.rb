class PoseMuscle < ApplicationRecord
    belongs_to :pose 
    belongs_to :muscle
end
