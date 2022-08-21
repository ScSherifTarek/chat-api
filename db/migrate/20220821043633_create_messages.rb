class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :body, null: false
      t.integer :number, null: false
      t.references :chat, foreign_key: true

      t.timestamps
    end
  end
end
