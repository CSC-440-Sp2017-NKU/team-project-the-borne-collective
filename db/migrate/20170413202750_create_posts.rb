class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :title
      t.references :user
      t.references :course
      
      t.timestamps
    end 
  end
end
