class RemoveUserIdFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :user_id, :integer
  end
end
