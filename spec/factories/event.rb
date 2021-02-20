FactoryBot.define do
    factory :event do
      title                  { Faker::Lorem.sentence }
      plan                   { Faker::Lorem.words(number: 4) }
      comment                { Faker::Lorem.sentence }
      url                    { Faker::Internet.url }
      place                  { Faker::Address.city }
      start_time             { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
      id                     { 1 }
      association :user
    end
end
