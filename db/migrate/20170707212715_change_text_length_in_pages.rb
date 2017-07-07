class ChangeTextLengthInPages < ActiveRecord::Migration[5.1]
  def change
    change_column :pages, :content, :text, :limit => 4294967295
  end
end