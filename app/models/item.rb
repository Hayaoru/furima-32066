class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :ship_value
  belongs_to :ship_area
  belongs_to :ship_day

  with_options numericality: { other_than: 1 } do
  validates :category_id ,:status_id, :ship_value_id,:ship_area_id,:ship_day_id 
  end
  
  with_options presence: true do
    validates :item_name,:info, :image
    validates :price,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },format: { with: /\A[0-9]+\z/ }
  end
  
  has_one_attached :image
  belongs_to :user
  has_one    :buy_item
  
  
end
