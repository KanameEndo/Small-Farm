10.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
              email: email,
              password: password,
              )
end
10.times do |n|
  titile = Gimei.kanji
  content = Gimei.kanji
  start_time = Faker::Date.forward(days: 10)
  Plan.create!(
    titile:         titile, 
    content:         content, 
    start_time:          start_time, 
    user_id:           "1", 
    created_at:          "2021-01-01 00:00:00",
    updated_at:          "2021-01-01 00:00:00"
  )
end