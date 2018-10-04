class CreateHardwareMessages < ActiveRecord::Migration
  def change
    create_table :hardware_messages do |t|
      t.references :user, index: true
      t.references :hardware, index: true
      t.string :subject
      t.text :body

      t.timestamps null: false
    end
    add_foreign_key :hardware_messages, :users
    add_foreign_key :hardware_messages, :hardwares
  end
end
