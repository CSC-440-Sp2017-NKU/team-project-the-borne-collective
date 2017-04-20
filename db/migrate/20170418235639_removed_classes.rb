class RemovedClasses < ActiveRecord::Migration[5.0]
  def change
    drop_table :classes
    drop_table :enroll
  end
end
