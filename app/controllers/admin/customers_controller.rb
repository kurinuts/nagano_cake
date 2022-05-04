class Admin::CustomersController < ApplicationController

def index
@customers = Customer.all.page(params[:page]).per(10)
end

def show
@customer = Customer.find(params[:id])
end

def edit
@customer = Customer.find(params[:id])
end

def views
@customer = Customer.find(params[:id])
end

def update
 @customer = Customer.find(params[:id])
 if @customer.update(customer_params)
 flash[:notice] = "successfully customer_update"
 redirect_to admin_customer_path(@customer)
 else
 render :index
 end
end

private
def customer_params
  params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :telephone_number, :is_deleted)
end

end
