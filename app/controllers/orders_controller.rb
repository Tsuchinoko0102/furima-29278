class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
  end

  def create
    @user = current_user
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
    if @order.valid?
      @order.save
      binding.pry
      redirect_to root_path
    else
      binding.pry
      redirect_to item_orders_path
    end
  end

  private

  def order_params
    params.require(:order_address)
    .permit(:hoge, :postal, :prefecture_id, :city, :house_number, :building, :phone_number)
    .merge(user: @user.id, item: @item.id)
  end

end
