class CartsController < ApplicationController
  def show
    @cart_order_products = current_order.order_products
    @cart_total = @cart_order_products.sum(:total_price)
  end
end
