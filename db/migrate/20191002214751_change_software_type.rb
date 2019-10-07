class ChangeSoftwareType < ActiveRecord::Migration
  def change
  	add_column :software_types, :type, :integer
  	add_column :software_types, :vendor_id, :integer
  	add_column :software_types, :commercial, :boolean
  	add_column :software_types, :version, :string
  end
end
