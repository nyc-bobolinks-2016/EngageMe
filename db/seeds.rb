
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
      time_taken: "00:50:00",
      notes: Faker::Lorem.paragraph
      )
  end
end

Presentation.all.each do |presentation|
  80.times do
    presentation.results.create(
      anger: rand(), 
      contempt: rand(), 
      disgust: rand(), 
      fear: rand(), 
      happiness: rand(), 
      neutral: rand(), 
      sadness: rand(), 
      surprise: rand() 
      )
  end
end

# Presentation.create(name: "Tyler's Presentation", location: "New York", audience: "DBC students", start_time: Time.now, end_time: Time.now + 3000, time_taken: "00:50:00", notes: "Hello world", user_id: 1)

# Presentation.create(name: "Roman's Presentation", location: "New York", audience: "DBC students", start_time: Time.now, end_time: Time.now + 3000, time_taken: "00:50:00", notes: "Hello world", user_id: 2)

# Presentation.create(name: "Amanda's Presentation", location: "New York", audience: "DBC students", start_time: Time.now, end_time: Time.now + 3000, time_taken: "00:50:00", notes: "Hello world", user_id: 3)

# Result.create(anger: 3.44697156e-7, contempt: 6.8442256e-7, disgust: 0.00009313403, fear: 2.90478118e-13, happiness: 0.999748647, neutral: 0.000157187445, sadness: 4.30214253e-10, surprise: 1.04141549e-8, presentation_id: 1)

# Result.create(anger: 0.00011789846, contempt: 0.0000228391418, disgust: 0.0180042554, fear: 4.828176e-7, happiness: 0.9683092, neutral: 0.0117861256, sadness: 0.000459061179, surprise: 0.00130010839, presentation_id: 2)

# Result.create(anger: 0.000732187647, contempt: 0.157044709, disgust: 0.0006150903, fear: 0.00001585795, happiness: 0.172506183, neutral: 0.6661481, sadness: 0.00258267671, surprise: 0.000355139578, presentation_id: 3)
