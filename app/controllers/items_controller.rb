class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:item_name, :info, :category_id, :status_id, :ship_value_id, :ship_area_id, :ship_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
