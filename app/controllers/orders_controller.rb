class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_items = @order.order_items
    # raise
  end
end
