class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :brand_id
      t.string :original_name
      t.string :russian_name
      t.string :about
      t.integer :sex
      t.string :image
      t.integer :price, default: 0
      t.boolean :in_stock, default: 0
      t.boolean :hidden, default: 0

      t.timestamps
    end
  end
end
