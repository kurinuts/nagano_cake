class ItemsController < ApplicationController
  def new
  
  end
  
  def create
  @item = Item.new(item_params)
  @item.admin_id = current_admin.id
  @admins = Admin.all
  @items = Item.all
  @admin = current_admin
  if @item.save
    flash[:notice] = "successfully book_create"
    redirect_to admin_path(@item)
  else
    render :new
  end
  end

  def index
  end

  def show
  end

  def edit
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active)
    # permit⇒sイト内で編集するところを記載
  end
  
  def item_params
   params.require(:name).permit(:name, :introduction, :price, :is_active)
  end
end