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
    content:       content,
    start_time:    start_time,
    user_id:       "2",
    created_at:    "2021-01-01 00:00:00",
    updated_at:    "2021-01-01 00:00:00"
  )
end

# 食品生成
Food.create!(
  item_name:         "トマト",
  variety:           "桃太郎トマト",
  comment:           "甘味が強くて適度な酸味もあり、ピンクがかった赤い果皮は熟すと赤みを増します。また、カットしてもゼリー部分が流れ出ず調理しやすいのもポイントです。",
  storage_method:    "■常温保存の場合3日程度　※20度以下　1つ1つ新聞紙で包み、ヘタを下にして風通しのよいカゴやザルにならべて冷暗所で保管します。",
  harvest:           "8月15日〜8月20日予定",
  price:             "200円",
  stock:             "10個",
  created_at:        "2021-01-01 00:00:00",
  updated_at:        "2021-01-01 00:00:00"
  )
Food.create!(
  item_name:         "じゃがいも",
  variety:           "男爵",
  comment:           "加熱するとホクホクした食感が楽しめ、これぞジャガイモと感じさせてくれる香りがあります。",
  storage_method:    "■常温保存の場合3～4か月以上と長く保存が可能　※20度以下",
  harvest:           "8月15日〜8月20日予定",
  price:             "200円",
  stock:             "10個",
  created_at:        "2021-01-01 00:00:00",
  updated_at:        "2021-01-01 00:00:00"
  )
Food.create!(
  item_name:         "きゅうり",
  variety:           "白イボキュウリ",
  comment:           "皮は濃い緑色をしていて全体に小さな白いイボを持つ、現在最も市場に出回っている品種です。水分を多く含みやわらかく、歯切れも良好で風味のクセも強くありません。",
  storage_method:    "■常温保存の場合3日程度　※20度以下　水分を拭き取って、1本ずつ、キッチンペーパーか新聞紙で包みます。さらに牛乳パックなどの容器に立てて冷暗所で保存すると長持ちします。",
  harvest:           "8月15日〜8月20日予定",
  price:             "200円",
  stock:             "10個",
  created_at:        "2021-01-01 00:00:00",
  updated_at:        "2021-01-01 00:00:00"
  )
Food.create!(
  item_name:         "なす",
  variety:           "千両茄子",
  comment:           "皮はつやがあり濃い紫色です。皮も実もほどよい柔らかさで、実の柔らかさと歯切れの良さが特徴です。煮ても焼いても揚げてもおいしく、幅広い料理に使うことができるナスです。",
  storage_method:    "■常温保存の場合3日程度　※20度以下　水分を拭き取って、1本ずつ、キッチンペーパーか新聞紙で包みます。5℃以下で冷蔵保存すると「低温障害」を起こし、変色や軟化につながります。冷蔵庫の中でも温度が管理されている野菜室へ入れるか、生のまま冷凍保存するといいです。",
  harvest:           "8月15日〜8月20日予定",
  price:             "200円",
  stock:             "10個",
  created_at:        "2021-01-01 00:00:00",
  updated_at:        "2021-01-01 00:00:00"
  )
Food.create!(
  item_name:         "とうもろこし",
  variety:           "バイカラーコーン",
  comment:           "黄色粒種と白粒種を掛け合わせて作られたトウモロコシで、黄色と白色の割合が3対1。甘みがもっとも強い品種です。",
  storage_method:    "■常温保存の場合3日程度　※20度以下　生のとうもろこしは、皮付きのままの保存がおすすめです。皮がとうもろこしの水分を守ってくれます。",
  harvest:           "8月15日〜8月20日予定",
  price:             "200円",
  stock:             "10個",
  created_at:        "2021-01-01 00:00:00",
  updated_at:        "2021-01-01 00:00:00"
  )

# 管理者生成
User.create!(
  name:              '管理者01',
  email:             'admin@example.com',
  password:          'admin01',
  password_confirmation: "admin01",
  admin: true
)
User.create!(
  name:             "管理者02",
  email:            "admin@example.jp",
  password:         "11111111",
  password_confirmation: "11111111",
  admin: true
)