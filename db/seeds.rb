require "csv"
require "faker"

Product.delete_all
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name = 'products'")

Category.delete_all
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name = 'categories'")

Comment.delete_all
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name = 'comments'")

Customer.delete_all
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name = 'customers'")

OrderProduct.delete_all
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name = 'order_products'")

Order.delete_all
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name = 'orders'")

starbucks_file = Rails.root.join("db/starbucks.csv")
starbucks_data = File.read(starbucks_file)
starbucks = CSV.parse(starbucks_data, headers: true)

pastry_file = Rails.root.join("db/pastry.csv")
pastry_data = File.read(pastry_file)
pastry = CSV.parse(pastry_data, headers: true, encoding: "utf-8")

ice_cream_file = Rails.root.join("db/ice_cream.csv")
ice_cream_data = File.read(ice_cream_file)
ice_cream = CSV.parse(ice_cream_data, headers: true)

# CATEGORIES
new_category_1 = Category.create(name: "Cold Desserts")
new_category_2 = Category.create(name: "Cakes")
new_category_3 = Category.create(name: "WorldWide")
new_category_4 = Category.create(name: "Treats")

# PRODUCT #1
ice_cream.take(100).each do |ice_cream_product|
  Product.create(
    name: ice_cream_product["name"],
    description: ice_cream_product["description"],
    price: Faker::Number.between(from: 1, to: 10),
    category_id: new_category_1.id
  )
end

# PRODUCT #2
100.times do
  Product.create(
    name: "#{Faker::Dessert.flavor} Cake",
    description: "Toppings: #{Faker::Dessert.topping}",
    price: Faker::Number.between(from: 1, to: 100),
    category_id: new_category_2.id
    )
end

# PRODUCT #3
pastry.take(100).each do |pastry_product|
  Product.create(
    name: pastry_product["Name"],
    description: "From #{pastry_product["Origin"]}, #{pastry_product["Description"]}",
    price: Faker::Number.between(from: 1, to: 25),
    category_id: new_category_3.id
    )
end

# PRODUCT #4
100.times do
  types = [ "Cakepops", "Cheesecake", "Biscuit", "Mousse" ]
  rand_type = types.sample

  Product.create(
    name: "#{Faker::Dessert.flavor} #{rand_type}",
    description: "Toppings: #{Faker::Dessert.topping}",
    price: Faker::Number.between(from: 1, to: 25),
    category_id: new_category_4.id
    )
end

# CATEGORY AND PRODUCT #5
unique_starbucks = starbucks.map { |category| category["type"] }.uniq
unique_starbucks.each do |category_5|
  new_category_5 = Category.create(
    name: category_5
  )

  starbucks_products = starbucks.select { |product| product["type"] == category_5 }
  starbucks_products.each do |product_5|
    Product.create(
      name: product_5["item"],
      description: "Calories: #{product_5["calories"]}",
      price: Faker::Number.between(from: 1, to: 25),
      category_id: new_category_5.id
      )
  end
end

# CUSTOMERS
100.times do
  roles = [ 2, 3 ]
  rand_roles = roles.sample

  customer = Customer.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    user_role: rand_roles
  )

  if customer.registered_user?
    customer.update(
      email: Faker::Internet.email(name: "#{customer.first_name}"),
      username: Faker::Internet.username(specifier: 5..20),
      password: Faker::Internet.password(min_length: 3)
    )
  end
end

puts "There are #{Category.count} Categories created."
puts "There are #{Product.count} Products created."
puts "There are #{Customer.count} Customers created."

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'pass123', password_confirmation: 'pass123')
end
