class Public::OrdersController < ApplicationController

  def new
  @order = Order.new
  @customer = current_customer
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

  # def show
  # @customer = current_customer
  # @order = Order.find(params[:id])
  # end

  def confirm
  @cart_items = current_customer.cart_items
  @order = Order.new
  if params[:order][:register_address] == '0'
  @order.sent_adress = current_customer.address
  @order.sent_code = current_customer.postal_code
  @order.sent_name = current_customer.name
  flash[:notice] = "successfully"
  elsif params[:order][:register_address] == '1'
  @address = Address.find(params[:order][:address_id])
  @order.sent_adress = @address.address
  @order.sent_code = @address.postal_code
  @order.sent_name = @address.name
  flash[:notice] = "successfully"
  elsif params[:order][:register_address] == '2'
  @order = Order.new(order_params)
  flash[:notice] = "successfully"
  end
  end

  private
  def order_params
    params.require(:order).permit(:sent_code, :sent_adress, :sent_name, :postage, :payment, :payment_method, :orders_status)
  end
end
