require 'faker'

# create posts

50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end

posts = Post.all

Post.where(title: "Trans Europe Express", body: "A Kraftwerk album.").first_or_create
post_kraft = Post.where(title: "Trans Europe Express")

# create comments

100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
end

post_kraft.comments.create(body: "That's right.")

puts "Seed finished."
puts "#{Post.count} posts created."
puts "#{Comment.count} comments created."