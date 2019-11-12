class ChangeSoftwateTypes < ActiveRecord::Migration
  def change
  	rename_column :software_types, :type, :software_type
  end
end
