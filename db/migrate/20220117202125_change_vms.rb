class ChangeVms < ActiveRecord::Migration
  def change
  	add_column :vms, :storage_timestamp, :date
  	add_column :vms, :storage_commmitted, :float
  	add_column :vms, :storage_uncommmitted, :float
  	add_column :vms, :storage_unshared, :float
  	add_column :vms, :hardware_timestamp, :string
  	add_column :vms, :hardware_numCPU, :integer
  	add_column :vms, :hardware_numCoresPerSocket, :integer
  	add_column :vms, :hardware_memory, :integer
  	add_column :vms, :place_before_archive, :string
  end
end
