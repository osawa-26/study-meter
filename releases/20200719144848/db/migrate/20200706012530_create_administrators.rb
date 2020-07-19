class CreateAdministrators < ActiveRecord::Migration[6.0]
  def change
    create_table :administrators do |t|
      t.string :manager_number, null: false
      t.string :hashed_password
      t.boolean :suspended, null: false, default: false

      t.timestamps
    end
    add_index :administrators, :manager_number, unique: true
  end
end
