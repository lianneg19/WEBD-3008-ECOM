module ApplicationHelper
  def current_order
    if session[:order_id] # is there order_id in session?
      order = Order.find(session[:order_id]) # if yes, fetch from db
    elsif customer_signed_in? # if signed in
      order = current_customer.orders.find_by(status: 1) ||
      Order.create(customer: current_customer) # find order with "active" status, OTHERWISE create new order for customer
    else # if no order_id found, customer not signed in
      order = Order.create(customer: current_customer) # create new order for current customer
      session[:order_id] = order.id # store order_id to session
    end
    order # return order
  end
end
