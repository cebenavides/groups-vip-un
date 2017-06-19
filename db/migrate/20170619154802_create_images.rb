class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.text :description
      t.integer :page_id

      t.timestamps
    end
  end
end
