class CreateOrderPrices < ActiveRecord::Migration
  def change
    create_table :order_prices do |t|
      t.integer :order_id
      t.integer :price_id

      t.timestamps
    end
  end
end
