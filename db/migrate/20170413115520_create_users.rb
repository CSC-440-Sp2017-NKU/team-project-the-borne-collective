class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, index: { unique: true }
      t.boolean :admin, default: false
      t.boolean :registrar, default: false
      t.string :password_digest
      t.string :remember_digest
     
      t.timestamps
    end
  end
end
