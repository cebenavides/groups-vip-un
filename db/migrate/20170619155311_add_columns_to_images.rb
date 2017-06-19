class AddColumnsToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :alt, :string, default: ""
    add_column :images, :hint, :string, default: ""
    remove_column :images, :description, :text
  end
end
