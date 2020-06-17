class AddDifficultyToPoses < ActiveRecord::Migration[6.0]
  def change
    add_column :poses, :difficulty, :string
  end
end
