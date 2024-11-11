json.extract! customer, :id, :first_name, :last_name, :email, :username, :password, :address, :phone_number, :user_role, :created_at, :updated_at
json.url customer_url(customer, format: :json)
