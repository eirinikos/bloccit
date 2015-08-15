require 'faker'

# create posts

50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end

posts = Post.all

post_lag = Post.create(title: "Lagunitas", body: "Lagunitas is a brewery in Petaluma, CA.")

# create comments

100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
end

post_lag.comments.create(body: "It sure is.")

puts "Seed finished."
puts "#{Post.count} posts created."
puts "#{Comment.count} comments created."