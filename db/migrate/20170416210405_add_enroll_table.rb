class AddEnrollTable < ActiveRecord::Migration[5.0]
  def change
    create_table :enroll do |t|
      t.integer :class_id
      t.integer :user_id
    end
  end
end
