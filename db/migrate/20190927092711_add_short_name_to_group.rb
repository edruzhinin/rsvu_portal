class AddShortNameToGroup < ActiveRecord::Migration
  def change
  	add_column :groups, :short_name, :string
  end
end
