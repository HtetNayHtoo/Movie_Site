class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :react_count
      t.string :content, null: false

      t.timestamps
    end
  end
end
