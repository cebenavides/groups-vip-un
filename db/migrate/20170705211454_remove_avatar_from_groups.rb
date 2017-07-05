class RemoveAvatarFromGroups < ActiveRecord::Migration[5.1]
  def change
    remove_attachment :groups, :avatar
  end
end
