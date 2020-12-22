class OrdersController < ApplicationController
  def index
    @item = Item.find_by(params[:item_id])
  end

  def new
  end

  def create
    binding.pry
    Order.create(order_params)
    BuyItem.create(buy_item_params)
    redirect_to action: :index
  end

  private

  def user_params
    params.permit(:name, :name_reading, :nickname)
  end

  def order_params()
    params.permit(:post_num, :prefecture_id, :city, :address, :building,:phone_num,:buy_item).merge(user_id: user.id)
  end

  def buy_item_params()
    params.merge(user_id: user.id)
  end
end
