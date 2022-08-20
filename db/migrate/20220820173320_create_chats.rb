class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.string :name, null: false
      t.integer :number, null: false
      t.references :application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
