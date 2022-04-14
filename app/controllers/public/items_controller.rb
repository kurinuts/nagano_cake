class Public::ItemsController < ApplicationController

  def create
  end

  def index
  @items =Item.all
  end
  
  def show
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active)
  end

end
