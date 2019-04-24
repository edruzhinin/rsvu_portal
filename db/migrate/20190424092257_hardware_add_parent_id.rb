class HardwareAddParentId < ActiveRecord::Migration
  def change
  	add_column :hardwares, :parent_id, :integer
  end
end
