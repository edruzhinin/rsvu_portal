class AddVendorToSoftwareType < ActiveRecord::Migration
  def change
  	add_column :software_types, :license_id, :integer
  end
end
