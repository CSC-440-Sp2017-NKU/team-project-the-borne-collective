class CreateCourseRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :course_records do |t|
      t.references :user
      t.references :course
      t.integer :status
      
    end
  end
end
