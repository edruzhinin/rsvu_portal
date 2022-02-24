class CreateVmSnapshots < ActiveRecord::Migration
  def change
    create_table :vm_snapshots do |t|
      t.references :vm, index: true
      t.references :VmSnapshot, index: true
      t.string :snapshot
      t.string :name
      t.datetime :create_time
      t.string :description

      t.timestamps null: false
    end
    add_foreign_key :vm_snapshots, :vms
    add_foreign_key :vm_snapshots, :VmSnapshots
  end
end
