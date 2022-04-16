class Admin::ItemsController < ApplicationController
  def new
  @item = Item.new
  @genres = Genre.all
  end
    
  def create
  item = Item.new(item_params)
  if item.save
  redirect_to admin_homes_path
  else
  render :new
  end
  end

  def show
  @item = Item.find(params[:id])
  end

  def index
  @items = Item.all
  end

  def update
  end

  private


  def item_params
  params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id, :image)
  end
end