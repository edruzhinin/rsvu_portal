class ChangeVmsValidTo < ActiveRecord::Migration
  def change
    remove_column :vms, :valid_to
    add_column :vms, :valid_to, :date
  end
end
