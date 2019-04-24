class HardwareAddGroupId < ActiveRecord::Migration
  def change
  add_column :hardwares, :group_id, :integer
  end
end
