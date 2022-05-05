class Admin::OrdersDetailsController < ApplicationController

def new
@order_detail = OrderDetail.new
end

def update
@order_detail = OrderDetail.find(params[:id])
@order_detail.update(order_detail_params)
# @orders = @order_detail.orders.all
@order = Order.find(params[:id])
# @order_details = @order.order_details.all
# if @oder_detail.production_status == "制作中"
# @orders.each do |order|
# order.update(order_status:1)
redirect_to admin_order_path(@order)
end
# 
# endelse
# # redirect_to admin_order_path(@order)
# # end

private
def order_detail_params
  params.require(:order_detail).permit(:production_status)
end

end