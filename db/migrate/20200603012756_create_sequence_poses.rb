class CreateSequencePoses < ActiveRecord::Migration[6.0]
  def change
    create_table :sequence_poses do |t|
      t.integer :sequence_id
      t.integer :pose_id
      t.integer :position_num

      t.timestamps
    end
  end
end
