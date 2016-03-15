FactoryGirl.define do
  factory :user do
    username { Faker::Name.first_name }
    password 'longsecret'
    password_confirmation 'longsecret'
    email { Faker::Internet.email }
  end
end
