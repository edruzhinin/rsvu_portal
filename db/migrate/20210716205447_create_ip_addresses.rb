class CreateIpAddresses < ActiveRecord::Migration
  def change
    create_table :ip_addresses do |t|
      t.string :ip
      t.string :hostname
      t.integer :vlan
      t.boolean :is_static
      t.datetime :lease_starts
      t.datetime :lease_ends
      t.string :comment
      t.references :mac_address, index: true

      t.timestamps null: false
    end
    add_foreign_key :ip_addresses, :mac_addresses
  end
end
