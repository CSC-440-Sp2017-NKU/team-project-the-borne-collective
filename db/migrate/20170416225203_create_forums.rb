class CreateForums < ActiveRecord::Migration[5.0]
  def change
    create_table :forums do |t|
      t.references :course
      t.string :name
      t.string :titleline
      t.timestamps
    end
  end
end
