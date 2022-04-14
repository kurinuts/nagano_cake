class Public::CustomersController < ApplicationController


def new
end

def show
@customer = Customer.find(params[:id])
@items = @customer.item
@item = Items.new
end

def index
@customer = cuurent_customer
@items = @customer.items
@item = Item.new
end

private
def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
end

end