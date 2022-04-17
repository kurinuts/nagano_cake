class Admin::CustomersController < ApplicationController

def index
@customers = Customer.all

end

private
def customer_params
  params.permit(:name, :email)
end

end
