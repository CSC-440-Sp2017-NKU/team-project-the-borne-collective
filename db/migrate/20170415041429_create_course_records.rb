class CreateCourseRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :course_records do |t|
      t.references :user
      t.references :course
      t.boolean :enrolled, default: false
      t.boolean :completed, default: false
      t.boolean :teaching, default: false
      t.boolean :has_taught, default: false
      
    end
  end
end
