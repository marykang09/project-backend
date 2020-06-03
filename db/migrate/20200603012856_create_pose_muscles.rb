class CreatePoseMuscles < ActiveRecord::Migration[6.0]
  def change
    create_table :pose_muscles do |t|
      t.integer :pose_id
      t.integer :muscle_id

      t.timestamps
    end
  end
end
