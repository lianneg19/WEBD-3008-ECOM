class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # before_action :set_render_order_cart
  # before_action :initialize_order_cart
  helper_method :current_customer

  # def after_sign_out_path_for(resource_or_scope)
  #   new_customer_session_path
  # end

  # sources used: https://www.youtube.com/watch?v=SPokmOwiM7E
  # def set_render_order_cart
  #   @render_order_cart = true
  # end

  # def initialize_order_cart
  #   if current_customer
  #     @order ||= Order.find_by(id: session[:order_id],
  #       customer_id: current_customer.id)

  #     if @order.nil?
  #       @order = Order.create(customer_id: current_customer.id)
  #       session[:order_id] = @order.id
  #     end
  #   else
  #     @order = nil
  #   end
  # end
end
