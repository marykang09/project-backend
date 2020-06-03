class CreateSequences < ActiveRecord::Migration[6.0]
  def change
    create_table :sequences do |t|
      t.integer :user_id
      t.string :name
      t.string :notes

      t.timestamps
    end
  end
end
