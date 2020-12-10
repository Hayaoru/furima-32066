class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create,:index]
  def index
  end

  def new
  end
  
  def create
    binding.pry
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.permit(:item_name,:info,:category_id,:status_id,:ship_value_id,:ship_area_id,:ship_day_id,:price,:image).merge(user_id: current_user.id)
  end

end
