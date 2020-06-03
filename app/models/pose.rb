class Pose < ApplicationRecord
    has_many :sequence_poses
    has_many :sequences, through: :sequence_poses
    has_many :pose_muscles
    has_many :muscles, through: :pose_muscles
end
