class AddColToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :status, :integer
    add_column :devices, :description, :string
    add_column :devices, :comment, :string
    add_column :devices, :sparam1, :string
    add_column :devices, :sparam2, :string
    add_column :devices, :sparam3, :string
    add_column :devices, :iparam1, :string
    add_column :devices, :iparam2, :string
    add_column :devices, :iparam3, :string
  end
end
