class CreateGroupImages < ActiveRecord::Migration[5.1]
  def change
    create_table :group_images do |t|
      t.integer :group_id
      t.attachment :avatar

      t.timestamps
    end
  end
end
