class AddAttachmentColumnsToGroups < ActiveRecord::Migration[5.1]
  def change
  	add_attachment :groups, :avatar
  end
end