class DropVms < ActiveRecord::Migration
  def change
  	remove_index :vms, :vmresource_id
  	drop_table :vms
  end
end
