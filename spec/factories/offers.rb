FactoryBot.define do
  factory :offer do
    status { Faker::Lorem.word }
    user
  end
end