class ChangeVmsAddSnapshot < ActiveRecord::Migration
  def change
  	add_column :vms, :currentSnapshot, :string
  end
end
