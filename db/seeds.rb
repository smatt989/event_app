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