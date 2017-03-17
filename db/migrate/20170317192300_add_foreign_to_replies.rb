class AddForeignToReplies < ActiveRecord::Migration[5.0]
  def change
    add_column :replies, :post_id, :integer
  end
end
