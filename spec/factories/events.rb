FactoryBot.define do
  factory :event do
    start_date { Time.now + 1.day }
    duration { 15 }
    title { Faker::Lorem.characters(10)}
    description { Faker::Lorem.characters(25) }
    price { Faker::Number.number(3) }
    location { Faker::Address.city }
    admin { User.all.sample }
  end
end
