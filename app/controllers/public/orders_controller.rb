class Public::OrdersController < ApplicationController

  def new
  @order = Order.new
  @customer = current_customer
  end

  def create
  @order = Order.new(order_params)
  if @order.save
  redirect_to orders_path
  else
  render :new
  end
  end

  def index
  @orders = current_customer.orders
  @customer = current_customer
  @total = 0
  end

  def show
  @orders = current_customer.orders
  end
  

  # def show
  # @customer = current_customer
  # @order = Order.find(params[:id])
  # end

  def confirm
  @cart_items = current_customer.cart_items
  @order = Order.new(order_params)
  @total = 0
  # @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  # @l_total = @cart_items.inject(0) { |sum, item| sum + item.subtotal + 800 }
  @order.postage = 800
  if params[:order][:register_address] == '0'
  @order.sent_adress = current_customer.address
  @order.sent_code = current_customer.postal_code
  @order.sent_name = current_customer.name
  flash[:notice] = "successfully"
  elsif params[:order][:register_address] == '1'
  @address = Address.find(params[:order][:address_id])
  @order.sent_address = @address.address
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
    params.require(:order).permit(:sent_code, :sent_address, :sent_name, :postage, :payment, :payment_method, :orders_status)
  end
   
end
