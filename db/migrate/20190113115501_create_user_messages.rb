class CreateUserMessages < ActiveRecord::Migration
  def change
    create_table :user_messages do |t|
      t.references :user, index: true
      t.references :commentable, polymorphic: true, index: true
      t.string :subject
      t.text :body

      t.timestamps null: false
    end
    add_foreign_key :user_messages, :users
  end
end
