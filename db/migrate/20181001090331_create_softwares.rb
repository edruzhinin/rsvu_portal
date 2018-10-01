class CreateSoftwares < ActiveRecord::Migration
  def change
    create_table :softwares do |t|
      t.references :hardware, index: true
      t.references :software_type, index: true
      t.string :name
      t.string :description
      t.string :sparam1
      t.string :sparam2
      t.string :sparam3
      t.integer :iparam1
      t.integer :iparam2
      t.integer :iparam3
      t.integer :status

      t.timestamps null: false
    end
    add_foreign_key :softwares, :hardwares
    add_foreign_key :softwares, :software_types
  end
end
