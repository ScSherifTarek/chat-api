class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.string :name, null: false
      t.string :token, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
