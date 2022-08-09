# User生成
10.times do |n|
  name = Gimei.kanji
  email = Faker::Internet.email
  password = "password"
  User.create!(
    name:         name,
    email:        email,
    password: password,
  )
end

# スケジュール生成
10.times do |n|
  title = Gimei.kanji
  content = Gimei.kanji
  start_time = Faker::Date.forward(days: 10)
  Plan.create!(
    title:         title,
    content:         content,
    start_time:          start_time,
    user_id:           "2",
    created_at:          "2021-01-01 00:00:00",
    updated_at:          "2021-01-01 00:00:00"
  )
end

# 食品生成
10.times do |n|
  item_name = Gimei.kanji
  variety = Gimei.kanji
  Food.create!(
    item_name:         item_name,
    variety:         variety,
    storage_method:        "2週間",
    harvest:          "8月15日〜8月20日予定",
    price:               "200",
    created_at:          "2021-01-01 00:00:00",
    updated_at:          "2021-01-01 00:00:00"
  )
end
# 管理者用ログイン
User.create!(
  name: '管理者',
  email: 'admin@example.com',
  password: 'admin01',
  password_confirmation: 'admin01',
  admin: true
)
User.create!(
  name:  "管理者02",
  email: "admin@example.jp",
  password:  "11111111",
  password_confirmation: "11111111",
  admin: true
)