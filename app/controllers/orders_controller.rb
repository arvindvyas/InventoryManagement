class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    if @order.save
      update_stock_levels
      redirect_to orders_path, notice: 'Order processed successfully.'
    else
      render :new
    end
  end

  private

  def update_stock_levels
    @order.line_items.each do |line_item|
      product = line_item.product
      product.update(quantity: product.quantity - line_item.quantity)
    end
  end

  def order_params
    params.require(:order).permit(:status, line_items_attributes: [:product_id, :quantity])
  end
end
