class DropTableVolumes < ActiveRecord::Migration
  def up
    drop_table :volumes
  end

  def down
  end
end
