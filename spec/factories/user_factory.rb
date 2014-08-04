FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:username) { |n| Faker::Internet.user_name+"#{n}" }
    sequence(:biola_id) { |n| Faker::Number.number(9)+"#{n}" }
    title { Faker::Name.title }
    email { Faker::Internet.email }
    photo_url { Faker::Internet.url('example.com', '/#{username}.jpg') }
    department { Faker::Commerce.department }

    affiliations { [] }
    entitlements { [] }
  end
end