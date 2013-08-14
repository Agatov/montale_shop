class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.integer :item_id
      t.integer :volume
      t.integer :price, default: 0
      t.boolean :in_stock, default: 1
      t.boolean :hidden, default: 0

      t.timestamps
    end
  end
end
