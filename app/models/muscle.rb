class Muscle < ApplicationRecord
    has_many :pose_muscles
    has_many :poses, through: :pose_muscles
end
