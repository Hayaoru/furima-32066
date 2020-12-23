class OrderForm
  include ActiveModel::Model
  attr_accessor :post_num,:prefecture_id,:city,:address,:building,:phone_num,:item_id,:user_id

  with_options presence: true do
    validates :prefecture_id,:city,:address,:phone_num
    validates :post_num, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :phone_num, format: { with: /\A\d{11}\z/}
  end

  def save
    binding.pry
    buy_item = BuyItem.create(item_id: item_id,user_id: user_id)
    
    Order.create(post_num: post_num, prefecture_id: prefecture_id,city: city,address: address,building: building,phone_num: phone_num,buy_item_id: buy_item.id)
  end
end