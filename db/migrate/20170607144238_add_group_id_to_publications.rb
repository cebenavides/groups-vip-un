class AddGroupIdToPublications < ActiveRecord::Migration[5.1]
  def change
    add_column :publications, :group_id, :integer
  end
end
