class AcrchiveDeleteVm < ActiveRecord::Migration
  def change
  	remove_index :archives, name: 'index_archives_on_vm_id'
  	remove_column :archives, :vm_id
  end
end
