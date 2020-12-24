class OrderForm
  include ActiveModel::Model
  attr_accessor :post_num,:prefecture_id,:city,:address,:building,:phone_num,:item_id,:user_id,:token

  with_options presence: true do
    validates :token,:city,:address,:phone_num,:user_id,:item_id
    validates :post_num, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :phone_num, format: { with: /\A\d{11}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
  end

  def save
    buy_item = BuyItem.create(item_id: item_id,user_id: user_id)
    
    Order.create(post_num: post_num, prefecture_id: prefecture_id,city: city,address: address,building: building,phone_num: phone_num,buy_item_id: buy_item.id)
  end
end