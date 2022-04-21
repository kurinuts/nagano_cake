class Public::OrdersController < ApplicationController

  def new
  @order = Order.new
  end

  def create
  @order = Order.new(order_params)
  if @order.save
  redirect_to order_path(order)
  else
  render :new
  end
  end

  def index
  @customer = current_customer
  end

  def edit
  end

  def show
  @customer = current_customer
  @order = Order.find(params[])
  end

  private
  def order_params
    params.require(:order).permit(:sent_code, :sent_address, :sent_name, :postage, :payment, :payment_method, :orders_status)
  end
end
