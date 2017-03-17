class RemovePostIdFromReplies < ActiveRecord::Migration[5.0]
  def change
    remove_column :replies, :post_id, :integer
  end
end
