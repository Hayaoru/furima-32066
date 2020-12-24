FactoryBot.define do
  factory :order_form do
    token           {'tok_abcdefghijk00000000000000000'}
    post_num        {'000-0000'}
    prefecture_id   {2}
    city            {'名古屋市'}
    address         {'港区1ー21'}
    building        {'栄ビル201'}
    phone_num       {'09011113333'}
    item_id         {1}
    user_id          {1}
  end
end
