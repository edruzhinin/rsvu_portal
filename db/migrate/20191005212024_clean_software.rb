class CleanSoftware < ActiveRecord::Migration
  def change
  	remove_index :softwares, name: 'index_softwares_on_hardware_id'
  	remove_column :softwares, :hardware_id
  	remove_column :softwares, :name
  	remove_column :softwares, :description
  	remove_column :softwares, :status
  	
  end
end
