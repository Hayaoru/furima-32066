class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create]
  def index
  end

  def new
  end
  
  def create
  @item = Item.create(item_params)
  end

  def item_params
    params.require(:item).permit(:item_name,:info,:category,:status,:ship_value,:ship_area,:ship_day,:price,:image).merge(user_id: current_user.id)
  end

end
