FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.email }
    password { "1a" + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    name_first { person.first.kanji }
    name_last { person.last.kanji }
    name_first_kana { person.first.katakana }
    name_last_kana { person.last.katakana }
    birthday { Faker::Date.backward }
  end
end