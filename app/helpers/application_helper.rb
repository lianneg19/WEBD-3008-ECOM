module ApplicationHelper
  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      order = Order.create
      session[:order_id] = order.id
      order
    end
  end
end
