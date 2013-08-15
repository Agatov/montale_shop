class AddFamilyIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :family_id, :integer
  end
end
