class AddClassTable < ActiveRecord::Migration[5.0]
  def change
    create_table :classes do |t|
      t.integer :class_id
      t.string :name
      t.string :description
      t.integer :faculty_id
    end
  end
end