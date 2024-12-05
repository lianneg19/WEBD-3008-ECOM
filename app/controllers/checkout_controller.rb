class CheckoutController < ApplicationController
  def create
    order_product_ids = params[:order_product_ids]
    order_products = OrderProduct.where(id: order_product_ids)

    if order_products.nil?
      redirect_to root_path
      return
    end
    # if order_products.order.customer.
    @session = Stripe::Checkout::Session.create(
      payment_method_types: [ "card" ],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url,
      mode: "payment",
      line_items: order_products.map do |order|
        {
        price_data: {
          currency: "cad",
          product_data: {
            name: order.product.name,
            description: order.product.description
          },
          unit_amount: (order.product.price * 100).to_i
        },
        quantity: 1
      }
      end
    )

    redirect_to @session.url, allow_other_host: true
  end

  def success
  end
  def cancel
  end

  def form
    @cart_order_products = current_order.order_products
    @cart_total = @cart_order_products.sum(:total_price)
  end
end
