class AddToVendor < ActiveRecord::Migration
  def change
  	add_column :vendors, :short_name, :string
  end
end
