class Public::ItemsController < ApplicationController

  def new
  @item = Item.new
  end

  def create
  item = Item.new(item_params)
  item.save
  redirect_to cart_item_path(@item)
  end

  def index
  @items = Item.page(params[:page])
  end

  def show
  @items = Item.all
  @item = Item.find(params[:id])
  @customer = current_customer
  @cart_item = CartItem.new
  end


  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image)
  end

  def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
  end

end
