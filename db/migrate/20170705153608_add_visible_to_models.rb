class AddVisibleToModels < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :visible, :boolean, :default => false, :null => false
    add_column :pages, :visible, :boolean, :default => false, :null => false
    add_column :publications, :visible, :boolean, :default => false, :null => false
  end
end