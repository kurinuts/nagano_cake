class Public::OrdersController < ApplicationController

  def new
  @order = Order.new
  @customer = current_customer
  end

  def create
  @order = Order.new(order_params)
  @order.customer_id = current_customer.id
  @order.save

  # @cart_items = current_customer.cart_items
  current_customer.cart_items.each do |cart_item|
   @order_detail = OrderDetail.new
   @order_detail.item_id = cart_item.item_id
   @order_detail.order_id = @order.id
   @order_detail.price = cart_item.item.price
   @order_detail.amount = cart_item.amount
   @order_detail.save
  end
  current_customer.cart_items.destroy_all
  redirect_to orders_complete_path
  end

  def index
  @orders = current_customer.orders
  @customer = current_customer
  @total = 0
  end

  def show
  @orders = current_customer.orders
  @order = Order.find(params[:id])
  # @item = current_customer.orders.item
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
  @order.sent_address = current_customer.address
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
    params.require(:order).permit(:customer_id, :sent_code, :sent_address, :sent_name, :postage, :payment, :payment_method, :orders_status)
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image)
  end

end
