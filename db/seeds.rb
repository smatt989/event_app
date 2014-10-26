User.create!(
	firstName: "John",
	lastName: "Paul",
	email: "john@paul.com",
	password: "foobar",
	password_confirmation: "foobar",
	activated: true,
	activated_at: Time.zone.now
	)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(
  	firstName: name.split(" ")[0],
	lastName: name.split(" ")[1],
	email: email,
	password: password,
	password_confirmation: password,
	activated: true,
	activated_at: Time.zone.now
  	)
end

users = User.order(:created_at).take(6)
50.times do |i|
	users.each { |user| user.events.create!(
			name: user.firstName + "'s Event "+i.to_s,
			description: Faker::Lorem.sentence(5),
			location: user.firstName + "'s House",
			startTime: Time.zone.now,
			endTime: Time.zone.now + 10.minutes
		)}
end