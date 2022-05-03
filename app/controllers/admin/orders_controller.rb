class Admin::OrdersController < ApplicationController

def index
@orders = Order.all.page(params[:page]).per(10)
end

def show
@customer = Customer.find(params[:id])
@orders = @customer.orders
end

end
