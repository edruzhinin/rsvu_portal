class CreateVmhosts < ActiveRecord::Migration
  def change
    create_table :vmhosts do |t|
      t.references :hardware, index: true
      t.string :name
      t.string :esxi_version
      t.integer :cpu_count
      t.integer :cpu_core_count
      t.integer :memory_size
      t.text :hardware_description
      t.integer :powerState

      t.timestamps null: false
    end
    add_foreign_key :vmhosts, :hardwares
  end
end
