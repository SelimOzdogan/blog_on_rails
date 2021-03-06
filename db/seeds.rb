# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
Post.destroy_all

100.times do
  p = Post.create({
    title: Faker::Lorem.question,
    body: Faker::Hacker.say_something_smart,
  })
  if p.valid?
    rand(1..10).times.each do
      Comment.create(
        body: Faker::Hacker.say_something_smart,
        post: p
      )
    end
  end
end

puts "Created #{Post.count} Posts"
puts "Created #{Comment.count} Comments"
