User.create!(name: "Example User",
             email: "example@railstutorial.org",
             password: "password",
             password_confirmation: "password",
             admin: true) # ! (bang) usage means this will raise an exception if it fails
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end