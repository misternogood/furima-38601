class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :authenticate_user!

  def index
    @order_shopper = OrderShopper.new
  end

  def create
    @order_shopper = OrderShopper.new(order_params)
    if @order_shopper.valid?
      @order_shopper.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_shopper).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if @item.user_id == current_user.id
  end
end
