class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_shopper = OrderShopper.new
  end
end
