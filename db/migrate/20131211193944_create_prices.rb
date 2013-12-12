class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :item_id
      t.string :name
      t.integer :volume
      t.integer :price
      t.boolean :in_stock, defaul: 1
      t.boolean :hidden, default: 0

      t.timestamps
    end
  end
end
