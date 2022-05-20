class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_type
      t.string :email
      t.string :password_digest
      t.integer :phone
      t.string :address
      t.datetime :dob

      t.timestamps
    end
  end
end
