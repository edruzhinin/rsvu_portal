class UpdateLicenses < ActiveRecord::Migration
  def change
  	rename_column :licenses, :type, :lic_type
  	add_column :licenses, :software_type_id, :integer
  end
end
