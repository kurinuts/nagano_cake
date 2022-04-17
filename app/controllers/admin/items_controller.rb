class Admin::ItemsController < ApplicationController

  def new
  @item = Item.new
  @genres = Genre.all
  end

  def create
  @item = Item.new(item_params)
  if @item.save
  redirect_to admin_item_path(@item)
  else
  @genres = Genre.all
  render :new
  end
  end

  def show
  @items = Item.all

  @item = Item.find(params[:id])
  end

  def index
  @items = Item.all
  @genres = Genre.all
  end
  
  def edit
  @item = Item.find(params[:id])
  @genres = Genre.all
  end

  def update
  @item = Item.find(params[:id])
  @genres = Genre.all  
  if @item.save
  redirect_to admin_item_path(@item)
  else
  @genres = Genre.all
  render :new
  end
  end

  private


  def item_params
  params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id, :image)
  end
end