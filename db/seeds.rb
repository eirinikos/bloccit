require 'faker'

# create posts

50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end

posts = Post.all

# create comments

100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
end

# create adverts

4.times do
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    copy: Faker::Lorem.paragraph,
    price: Faker::Number.number(3)
    )
end

puts "Seed finished."
puts "#{Post.count} posts created."
puts "#{Comment.count} comments created."
puts "#{Advertisement.count} adverts created."