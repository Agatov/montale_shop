class AddIndexToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :index, :string
  end
end
