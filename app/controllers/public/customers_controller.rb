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
@customer = Customer.find(params[:id])
@customer.update(customer_params)
  if @customer.save
  flash[:notice] = "successfully book_update"
  redirect_to customer_path(@customer.id)
  else
  render :edit
  end
end

private
def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
end

def correct_customer
    @item = Item.find(params[:id])
    @customer = @item.customer
    redirect_to(items_path) unless @customer == current_customer
end

end