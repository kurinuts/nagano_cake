class Public::CustomersController < ApplicationController


def new
end


def create
end

def show
@customer = current_customer
# @cart_items = @customer.cart_item
# @cart_items = CartItems.new
end

def index
@customer = current_customer
# @items = @customer.items
# @item = Item.new
end

def edit
@customers =Customer.all
@customer = current_customer

end

def update
end

private
def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
end

end