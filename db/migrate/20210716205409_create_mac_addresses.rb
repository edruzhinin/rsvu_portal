class CreateMacAddresses < ActiveRecord::Migration
  def change
    create_table :mac_addresses do |t|
      t.string :mac
      t.string :comment

      t.timestamps null: false
    end
  end
end
