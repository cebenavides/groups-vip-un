class RemoveApprovedFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :approved, :boolean
  end
end
