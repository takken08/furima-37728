FactoryBot.define do
  factory :product do
    item_name           {Faker::Name.initials}
    explanation         {Faker::Lorem.sentence}
    category_id         {Faker::Number.between(from: 2, to: 11)}
    item_state_id       {Faker::Number.between(from: 2, to: 7)}
    delivery_charge_id  {Faker::Number.between(from: 2, to: 3)}
    area_id             {Faker::Number.between(from: 2, to: 48)}
    delivery_day_id     {Faker::Number.between(from: 2, to: 4)}
    selling_price       {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
