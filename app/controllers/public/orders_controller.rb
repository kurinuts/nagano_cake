class Public::OrdersController < ApplicationController
  
  def new
  end
  
  def index
  @customer = current_customer
  end
  
  def edit
  end
  
  def show
  @customer = current_customer
  end
end
