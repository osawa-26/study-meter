AppUser.create!(
  email: "kabigon@example.com",
  family_name: "竈門",
  given_name: "丹三郎",
  family_name_kana: "カマド",
  given_name_kana: "タンサブロウ",
  nickname: "たんちゃん",
  gender: "male",
  birthday: "1993/07/15",
  prefecture: "富山県",
  target: "明治大学合格",
  password: "password",
  start_date: Date.today
)

family_names = %w{
  佐藤:サトウ:sato
  鈴木:スズキ:suzuki
  高橋:タカハシ:takahashi
  田中:タナカ:tanaka
}

given_names = %w{
  二郎:ジロウ:jiro
  三郎:サブロウ:saburo
  四郎:シロウ:shiro
  五郎:ゴロウ:goro
  六郎:ロクロウ:rokuro
}

20.times do |n|
  fn = family_names[n % 4].split(":")
  gn = given_names[n % 5].split(":")

  AppUser.create!(
    email: "#{fn[2]}.#{gn[2]}@example.com",
    family_name: fn[0],
    given_name: gn[0],
    family_name_kana: fn[1],
    given_name_kana: gn[1],
    nickname: "たんちゃん",
    gender: n < 5 ? "male" : "female",
    birthday: "1993/07/15",
    prefecture: "富山県",
    target: "明治大学合格",
    password: "password",
    start_date: (100 - n).days.ago.to_date,
    end_date: n == 0 ? Date.today : nil,
    suspended: n == 1
  )
end
