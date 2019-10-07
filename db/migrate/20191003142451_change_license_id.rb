class ChangeLicenseId < ActiveRecord::Migration
  def change
  	add_column :softwares, :license_id, :integer
  	remove_column :software_types, :license_id
  end
end
