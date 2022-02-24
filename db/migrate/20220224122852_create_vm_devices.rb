class CreateVmDevices < ActiveRecord::Migration
  def change
    create_table :vm_devices do |t|
      t.references :vm, index: true
      t.string :type
      t.string :lavel
      t.string :summary
      t.boolean :start_connected
      t.boolean :connected
      t.string :status
      t.string :mac
      t.string :devicename
      t.string :network

      t.timestamps null: false
    end
    add_foreign_key :vm_devices, :vms
  end
end
