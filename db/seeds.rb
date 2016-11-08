User.create(
  username: "Tyler",
  email: "tyler@tyler.com",
  password: "password",
  organization: "DBC"
  )

User.create(username: "Roman",
  email: "roman@roman.com",
  password: "password",
  organization: "DBC"
  )

User.create(
  username: "Amanda",
  email: "amanda@amanda.com",
  password: "password",
  organization: "DBC"
  )

User.all.each do |user|
  3.times do
    user.presentations.create(
      name: Faker::Company.catch_phrase,
      location: Faker::Address.state,
      audience: Faker::University.name,
      start_time: Time.now,
      end_time: Time.now + 3000,
      time_taken: 23534,
      notes: Faker::Lorem.paragraph
      )
  end
end

Presentation.all.each do |presentation|
  80.times do
    decimals = [0.00986699999999996, 0.690133, 2.3499999999995747e-05, 0.09997650000000001, 0.05433, 0.04567, 0.04, 0.06 ]

    presentation.results.create(
      anger: decimals.delete(decimals.sample),
      contempt: decimals.delete(decimals.sample),
      disgust: decimals.delete(decimals.sample),
      fear: decimals.delete(decimals.sample),
      happiness: decimals.delete(decimals.sample),
      neutral: decimals.delete(decimals.sample),
      sadness: decimals.delete(decimals.sample),
      surprise: decimals.delete(decimals.sample)
      )
  end
end
