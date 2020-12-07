FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 4)+"a1"}
    password_confirmation {password}
    last_name             {"田中"}
    first_name            {"太郎"}
    last_name_kana        {"タナカ"}
    first_name_kana       {"タロウ"}
    birthday              {"2000-01-01"}
  end
end