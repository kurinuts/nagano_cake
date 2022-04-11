class CustomersController < ApplicationController
  def new

  end
  
  def create
  @customer = Customer.find(params[:id])
  
  end

  def index
  @customer = current_customer
  @customers = Customer.all
  end

  def show
  # @customers = Customer.all
  # @customer = Customer.find(params[:id])
  @customer = current_customer
  @items = @customer.items
  @item = Item.new
  end

  def edit
  @customer = Customer.find(params[:id])
  end
  
  def destroy
  end
  
  def customer_params
    params.require(:customer).permit(:last_name, :last_name_kana, :first_name, :first_name_kana)
    # permit⇒sイト内で編集するところを記載
  end
end

