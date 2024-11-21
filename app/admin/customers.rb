ActiveAdmin.register Customer do
  permit_params :first_name, :last_name, :email, :username, :password, :address, :phone_number, :user_role
end
