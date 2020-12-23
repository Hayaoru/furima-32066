class OrdersController < ApplicationController
  before_action :set_item,only:[:index,:create]

  def index
    @order_form=OrderForm.new
  end

  def new
  end

  def create
    
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
       @order_form.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_form).permit(:post_num, :prefecture_id, :city, :address, :building,:phone_num).merge(user_id: current_user.id).merge(item_id: params[:item_id])
  end


end
