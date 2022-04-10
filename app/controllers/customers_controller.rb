class CustomersController < ApplicationController
  def new

  end
  
  def create
  @customer = Customer.find(params[:id])
  end

  def index
  end

  def show
  end

  def edit
  end
  
  def destroy
  end
  
  def customer_params
    params.require(:customer).permit(:last_name, :last_name_kana, :first_name, :first_name_kana)
    # permit⇒sイト内で編集するところを記載
  end
end
