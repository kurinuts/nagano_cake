class Public::AddressesController < ApplicationController

  def new
  @address = Address.new
  end

  def create
  @addresses = current_customer.addresses
  @address = Address.new(address_params)
  @address.customer_id = current_customer.id
  if @address.save
  redirect_to addresses_path
  else
  render :index
  end
  end

  def index
  @addresses = Address.all
  @address = Address.new
  end

  def edit
  @address = Address.find(params[:id])
  # @address.customer_id = current_customer.id
  end

  def update
  @address = Address.find(params[])
  end

  def destroy

  end

  private
  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
