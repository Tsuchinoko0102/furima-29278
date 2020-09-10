class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create 
    @item = Item.create(item_params)
    @item.save
    redirect_to root_path
  end

  def item_params
    params.require(:item)
    .permit(:name, :text, :price, :user, :category_id, :status_id, :fee_id, :prefecture_id, :duration_id, :image)
    .merge(user_id: current_user.id)
  end
end
