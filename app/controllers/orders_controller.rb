class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_check
  before_action :sold_check

  def index
    item_user_scan
    @order = OrderAddress.new
    @order_address = OrderAddress.new
  end

  def create
    item_user_scan
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render "index"
    end
  end

  private

  def order_params
    params.require(:order_address)
          .permit(:token, :postal, :prefecture_id, :city, :house_number, :building, :phone_number, :order_id)
          .merge(user: @user.id, item: @item.id, price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def user_check
    item_user_scan
    redirect_to root_path if @user.id == @item.user.id
  end

  def item_user_scan
    @user = current_user
    @item = Item.find(params[:item_id])
  end

  def sold_check
    redirect_to root_path if @item.order.present?
  end
end
