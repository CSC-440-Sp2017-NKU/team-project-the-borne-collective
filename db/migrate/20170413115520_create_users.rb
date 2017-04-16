class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
<<<<<<< HEAD
      t.string :email, index: { unique: true }
      t.boolean :admin, default: false
      t.boolean :registrar, default: false
      t.string :password_digest
      t.string :remember_digest
     
=======
      t.string :email

>>>>>>> 6c1e3d86a85f4be286fe5f85dda6d69d39499410
      t.timestamps
    end
  end
end
