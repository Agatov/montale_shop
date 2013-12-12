class DropTableOrderVolumes < ActiveRecord::Migration
  def up
    drop_table :order_volumes
  end

  def down
  end
end
