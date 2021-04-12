FactoryBot.define do
  factory :user do
    nick_name             {Faker::Name.initials(number: 5)}
    kanji_family_name     {Faker::Name.initials(number: 2)}
    kanji_given_name      {Faker::Name.initials(number: 2)}
    katakana_family_name  {Faker::Name.initials(number: 3)}
    katakana_given_name   {Faker::Name.initials(number: 3)}
    date_of_birth         {Faker::Date.birthday(min_age: 18, max_age: 65)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end