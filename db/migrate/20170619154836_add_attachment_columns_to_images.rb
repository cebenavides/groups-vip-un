class AddAttachmentColumnsToImages < ActiveRecord::Migration[5.1]
  def change
  	add_attachment :images, :file
  end
end
