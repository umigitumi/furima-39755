FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    #password              {Faker::Alphanumeric.alphanum(6).sample}
    password_confirmation {password}
    encrypted_password    {password}
    #name_first            {Faker::Name.initials(number: 2)}
    #name_last             {Faker::Name.initials(number: 2)}
    #name_first_kana       {Faker::Name.initials(number: 2)}
    #name_last_kana        {Faker::Name.initials(number: 2)}
    name_first             {Faker::Japanese::Name}
    name_last              {Faker::Japanese::Name}
    name_first_kana        {Faker::Japanese::Name}
    name_last_kana         {Faker::Japanese::Name}
    birthday               {Date.today - 10.years}

  end
end