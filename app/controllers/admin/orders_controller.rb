class Admin::OrdersController < ApplicationController

def index
@orders = Order.all.page(params[:page]).per(10)
end

def show
@order = Order.find(params[:id])
@order_details = @order.order_details
@customer = @order.customer
end

def update
@order = Order.find(params[:id])
@order.update(order_params)
@order_details = @order.order_details.all
if @order.orders_status == "入金確認"
@order_details.each do |order_detail|
order_detail.update(production_status:1)
redirect_to admin_order_path(@order)
end
else
render :show
end
end

private
def customer_params
  params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :telephone_number, :is_deleted)
end

def order_params
    params.require(:order).permit(:customer_id, :sent_code, :sent_address, :sent_name, :postage, :payment, :payment_method, :orders_status)
end
end
