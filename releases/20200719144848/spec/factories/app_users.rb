FactoryBot.define do
  factory :app_user do
    sequence(:email) { |n| "user#{n}@example.com" }
    family_name { "山田" }
    given_name { "太郎" }
    family_name_kana { "ヤマダ" }
    given_name_kana { "タロウ" }
    password { "pw" }
    nickname { "サブロウ" }
    gender { "男" }
    birthday { 1990/01/01 }
    prefecture { "兵庫県" }
    target { "法政大学合格" }
    start_date { Date.yesterday }
    end_date { nil }
    suspended { false }
  end
end
