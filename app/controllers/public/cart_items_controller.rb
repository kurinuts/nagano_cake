class Public::CartItemsController < ApplicationController

  def new
  @cart_item = @cart_item.new
  end

  def create
  @cart_item = CartItem.new(cart_item_params)
  @cart_item.customer_id = current_customer.id
  @customers = Customer.all
  @cart_items = CartItem.all
  @customer = current_customer
  if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
   cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
   cart_item.amount += params[:cart_item][:amount].to_i
   cart_item.save
     flash[:notice] = "Item was successfully added to cart."
		 redirect_to cart_items_path
  elsif @cart_item.save
		 flash[:notice] = "New Item was successfully added to cart."
		 redirect_to cart_items_path
	else
     render :index
  end
  end

  def show
  end

  def index
  @customer = current_customer
  @cart_items = current_customer.cart_items
  # @total_price = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }

  # @item = Item.find(params[:item_id])
  end

  def destroy
  @customer = current_customer
  @cart_item = CartItem.find(params[:id])
  @cart_items = current_customer.cart_items
  if @cart_item.destroy
  flash[:notice] = "successfully cart_item_delete"
  redirect_to cart_items_path
  else
  render :index
  end
  end
  
  # def destroy.all
  # @customer = current_customer
  # @cart_items = current_customer.cart_items
  # @cart_item = CartItem.find(params[:id])
  # if @CartItem.destroy_all
  # flash[:notice] = "successfully cart_item_delete"
  # redirect_to cart_items_path
  # else
  # render :index
  # end
  # end
  

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
