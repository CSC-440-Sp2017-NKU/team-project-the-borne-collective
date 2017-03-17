class AddForeignToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :forum_id, :integer
  end
end
