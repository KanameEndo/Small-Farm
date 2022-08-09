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
  Food.create!(
    item_name:         "じゃがいも#{n + 1}",
    variety:           "男爵#{n + 1}",
    comment:           "ほくほくで美味しい#{n + 1}",
    storage_method:    "風通しがよく、光の当たらない場所で常温保存#{n + 1}",
    harvest:           "8月15日〜8月20日予定#{n + 1}",
    price:             "200円#{n + 1}",
    stock:             "10個#{n + 1}",
    created_at:        "2021-01-01 00:00:00",
    updated_at:        "2021-01-01 00:00:00"
  )
end

# admin用
User.create!(
  name: '管理者',
  email: 'admin@example.com',
  password: 'admin01',
  admin: true
)