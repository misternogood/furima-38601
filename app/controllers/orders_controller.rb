class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_shopper = OrderShopper.new
  end

  def create
    @order_shopper = OrderShopper.new(order_params)
    if @order_shopper.valid?
      @order_shopper.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      @order_shopper = OrderShopper.new
      render :index
    end
  end

  private
  def order_params
    params.require(:order_shopper).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
