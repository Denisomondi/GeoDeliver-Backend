# seeds.rb
puts "🌱 Seeding deliveries..."

# Seed Users
user1 = User.create(name: 'John Doe', email: 'john@example.com', password: 'password', address: '123 Main St', phone_number: '123-456-7890')
user2 = User.create(name: 'Jane Smith', email: 'jane@example.com', password: 'password', address: '456 Elm St', phone_number: '987-654-3210')

# Seed Orders
order1 = Order.create(total_amount: 50.0, status: 'pending', user_id: user1.id)
order2 = Order.create(total_amount: 75.0, status: 'in progress', user_id: user2.id)

# Seed Products
product1 = Product.create(name: 'Product 1', price: 10.0, description: 'This is product 1')
product2 = Product.create(name: 'Product 2', price: 20.0, description: 'This is product 2')

# Seed OrderItems
OrderItem.create(order_id: order1.id, product_id: product1.id, quantity: 3)
OrderItem.create(order_id: order1.id, product_id: product2.id, quantity: 2)
OrderItem.create(order_id: order2.id, product_id: product1.id, quantity: 1)

puts "✅ Done seeding!"