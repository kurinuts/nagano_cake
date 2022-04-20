class Public::CartItemsController < ApplicationController

  def new
  @cart_item = @cart_item.new
  end

  def create
  @cart_item = @cart_item.new
  @cart_item.customer_id = current_customer.id
  @customers = Customer.all
  @cart_items = CartItem.all
  @customer = current_customer
  if @cart_item.save
    flash[:notice] = "successfully book_create"
  redirect_to cart_items_path(@cart_item)
  else
  render :index
  end
  end

  def show
  end

  def index
  @customer = current_customer
  @cart_items = CartItem.all
  @cart_item = @customer.cart_items

  # @item = Item.find(params[:item_id])
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image)
  end

  def coorect_customer
    @item = Item.find(params[:id])
    @customer = @item.customer
    redirect_to(items_path) unless @customer == current_customer
  end
end
