class AddSiteToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :site, :string
  end
end
