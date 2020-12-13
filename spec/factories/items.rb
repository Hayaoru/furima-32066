FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.sentence }
    info           { Faker::Lorem.sentence }
    category_id    { 3 }
    status_id      { 2 }
    ship_value_id  { 2 }
    ship_area_id   { 2 }
    ship_day_id    { 2 }
    price          { 2000 }
    association :user
  end
end
