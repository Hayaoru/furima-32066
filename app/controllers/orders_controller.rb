class OrdersController < ApplicationController
  before_action :authenticate_user!,only: [:index]
  before_action :set_item,only:[:index,:create]

  def index
    if @item.user == currnet_user || @item.user != current_user && @item.order.present?
      redirect_to root_path
    end
    @order_form=OrderForm.new
  end

  def new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
       pay_item
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
    params.require(:order_form).permit(:post_num, :prefecture_id, :city, :address, :building,:phone_num).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

end
