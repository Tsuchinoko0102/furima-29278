class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
  end

  def create
    @user = current_user
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
    binding.pry
    if @order.valid?
      binding.pry
      pay_item
      @order.save
      redirect_to root_path
    else
      binding.pry
      redirect_to item_orders_path
    end
  end

  private

  def order_params
    params.require(:order_address)
    .permit(:token, :postal, :prefecture_id, :city, :house_number, :building, :phone_number)
    .merge(user: @user.id, item: @item.id, price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
