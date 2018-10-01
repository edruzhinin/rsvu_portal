class CreateSoftwareTypes < ActiveRecord::Migration
  def change
    create_table :software_types do |t|
      t.string :name
      t.string :comment
      t.string :sparam1
      t.string :sparam2
      t.string :sparam3
      t.string :iparam1
      t.string :iparam2
      t.string :iparam3

      t.timestamps null: false
    end
  end
end
