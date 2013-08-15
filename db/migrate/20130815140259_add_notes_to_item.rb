class AddNotesToItem < ActiveRecord::Migration
  def change
    add_column :items, :top_notes, :string
    add_column :items, :middle_notes, :string
    add_column :items, :lower_notes, :string
  end
end
