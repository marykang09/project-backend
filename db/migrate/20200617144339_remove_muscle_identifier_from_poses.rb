class RemoveMuscleIdentifierFromPoses < ActiveRecord::Migration[6.0]
  def change
    remove_column :poses, :muscle_identifer
  end
end
