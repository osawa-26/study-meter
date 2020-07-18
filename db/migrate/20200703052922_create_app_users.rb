class CreateAppUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :app_users do |t|
      t.string :email, null: false # メールアドレス
      t.string :family_name, null: false # 姓
      t.string :given_name, null: false # 名
      t.string :family_name_kana, null: false # 姓(カナ)
      t.string :given_name_kana, null: false # 名(カナ)
      t.string :nickname, null: false # 名(カナ)
      t.string :gender, null: false
      t.date :birthday, null: false
      t.string :prefecture ,null: false
      t.string :target ,null: false
      t.string :hashed_password # パスワード
      t.date :start_date # 開始日
      t.date :end_date # 終了日
      t.boolean :suspended, null: false, default: false #　無効フラグ

      t.timestamps
    end

#    add_index :app_users, LOWER('email'), unique: true
    add_index :app_users, [ :family_name_kana, :given_name_kana ]
  end
end
