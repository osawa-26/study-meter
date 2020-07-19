class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :material
      t.date :study_date
      t.integer :study_hour
      t.integer :study_minute
      t.string :memo
      t.references :app_user, null: false, index: false, foreign_key: true

      t.timestamps
    end

    add_index :records, :created_at
    add_index :records, [ :app_user_id, :created_at ]
  end
end
