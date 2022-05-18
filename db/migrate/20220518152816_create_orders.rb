class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :total_price
      t.integer :qty
      t.datetime :deliver_date
      t.boolean :deliver_flg

      t.timestamps
    end
  end
end
