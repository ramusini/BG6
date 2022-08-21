FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    encrypted_password { 'password' }
    name { Faker::Name.name }
    postal_code { '1231234' }
    prefecture { '東京都' }
    city { '渋谷区' }
    age { Faker::Number.within(range: 1..99) }
    memo { Faker::Lorem.characters(number:30) }
    boolean { Faker::Boolean.boolean }
  end
end