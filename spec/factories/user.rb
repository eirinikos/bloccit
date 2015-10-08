FactoryGirl.define do
  factory :user do
    name "Douglas Adams"
    sequence(:email, 100) { |n| "person#{n}@example.com"}
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now

    factory :user_with_post_and_comment, class: User do
      after(:build) do |user|
        create(:post, user: user_with_post_and_comment)
        create(:comment, user: user_with_post_and_comment)
      end
    end
  end
end