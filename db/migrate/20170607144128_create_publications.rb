class CreatePublications < ActiveRecord::Migration[5.1]
  def change
    create_table :publications do |t|
      t.text :name
      t.string :link
      t.timestamps
    end
  end
end
