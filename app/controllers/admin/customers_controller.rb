class Admin::CustomersController < ApplicationController

def index
@customers = Customer.all.page(params[:page]).per(10)

end

private
def customer_params
  params.permit(:name, :email)
end

end
