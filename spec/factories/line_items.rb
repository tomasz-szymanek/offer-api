FactoryBot.define do
  factory :line_item do
    name { Faker::Lorem.word }
    quantity { Faker::Number.number }
    price { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Company.catch_phrase }
    offer { nil }
  end
end