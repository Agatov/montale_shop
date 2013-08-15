class CreateOrderVolumes < ActiveRecord::Migration
  def change
    create_table :order_volumes do |t|
      t.integer :order_id
      t.integer :volume_id

      t.timestamps
    end
  end
end
