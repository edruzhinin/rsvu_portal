class AddVMvalidTo < ActiveRecord::Migration
  def change
  	add_column :vms, :valid_to, :datetime
  end
end
