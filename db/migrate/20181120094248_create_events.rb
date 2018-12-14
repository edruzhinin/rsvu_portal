class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.references :user, index: true
      t.datetime :from_time
      t.datetime :to_time
      t.boolean :permanent

      t.timestamps null: false
    end
    add_foreign_key :events, :users
  end
end
