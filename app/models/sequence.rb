class Sequence < ApplicationRecord
    belongs_to :user
    has_many :sequence_poses
    has_many :poses, through: :sequence_poses
end
