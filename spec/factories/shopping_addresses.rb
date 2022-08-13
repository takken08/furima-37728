FactoryBot.define do
  factory :shopping_address do
    Faker::Config.locale = :ja
    post_code    {Faker::Address.postcode}
    area_id      {Faker::Number.between(from: 2, to: 48)}
    municipality {Faker::Address.city}
    house_number { '青山1-1-1' }
    building_name { '春日部' } 
    phone_number { '09012345678' }
    token { "tok_abcdefghijk00000000000000000" }
  end
end
