FactoryBot.define do
    factory :room do
      name                  {Faker::Name.initials(number: 4)}
    end
end
