class Public::HomesController < ApplicationController

  def top
  @items = Item.order('id DESC').limit(3)
  # @items = Item.all
  end

  def about
  end

end
