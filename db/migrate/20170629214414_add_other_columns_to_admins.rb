class AddOtherColumnsToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :name, :string
    add_column :admins, :position, :text
    add_attachment :admins, :avatar
  end
end