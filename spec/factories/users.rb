FactoryBot.define do
  factory :user do
    transient do
      name {Gimei.name}
    end
    email                 {Faker::Internet.free_email}
    password              {'a1' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname              {Faker::Name.initials(number: 3)}
    last_name             {name.last.kanji}
    first_name            {name.first.kanji}
    last_name_katakana    {name.last.katakana}
    first_name_katakana   {name.first.katakana}
    date_of_birth         {Faker::Date.backward}
  end
end