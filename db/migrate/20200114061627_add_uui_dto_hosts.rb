class AddUuiDtoHosts < ActiveRecord::Migration
  def change
  	add_column :vms, :instance_uuid, :string
  	add_column :vms, :mo_id, :integer
  end
end
