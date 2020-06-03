class CreatePoses < ActiveRecord::Migration[6.0]
  def change
    create_table :poses do |t|
      t.string :english_name
      t.string :sanskrit_name
      t.string :img_url
      t.string :muscle_identifer

      t.timestamps
    end
  end
end
