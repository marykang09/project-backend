class AddCategoryToPoses < ActiveRecord::Migration[6.0]
  def change
    add_column :poses, :category, :string
  end
end
