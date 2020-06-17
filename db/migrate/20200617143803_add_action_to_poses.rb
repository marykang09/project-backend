class AddActionToPoses < ActiveRecord::Migration[6.0]
  def change
    add_column :poses, :action, :string
  end
end
