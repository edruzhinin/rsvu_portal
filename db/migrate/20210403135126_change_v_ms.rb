class ChangeVMs < ActiveRecord::Migration
  def change
    add_column :vms, :use_type, :integer
    add_column :vms, :always_on, :boolean
  end
end
