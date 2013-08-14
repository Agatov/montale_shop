class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :brand_id
      t.string :original_name
      t.string :russian_name
      t.text :about
      t.integer :sex_cd
      t.string :image
      t.integer :price, default: 0
      t.boolean :in_stock, default: 1
      t.boolean :hidden, default: 0

      t.timestamps
    end
  end
end
