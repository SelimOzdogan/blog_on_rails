# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Comment.destroy_all
Post.destroy_all

password = 1

User.create({
  name: "Selim Ozdogan",
  email: "selimozdogan@hotmail.com",
  password: password.to_s,
  is_admin: true
})
9.times do
  password += 1
  User.create({
    name: Faker::Name.first_name + " " + Faker::Name.last_name,
    email: Faker::Internet.email,
    password: password.to_s,
  })
end

users = User.all
100.times do
  p = Post.create({
    title: Faker::Lorem.question,
    body: Faker::Hacker.say_something_smart,
    user: users.sample,
  })
  if p.valid?
    rand(0..10).times.each do
      Comment.create(
        body: Faker::Hacker.say_something_smart,
        post: p,
        user: users.sample,
      )
    end
  end
end

puts "Created #{Post.count} Posts"
puts "Created #{Comment.count} Comments"
puts "Created #{User.count} Users"
