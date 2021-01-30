FactoryBot.define do
  factory :post do
    title { Faker::Movies::StarWars.character }
    body { Faker::Movies::StarWars.character }
  end
end