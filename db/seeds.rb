10.times do
  Customer.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    address: Faker::Address.full_address
  )
end

20.times do
  Item.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    description: Faker::Lorem.sentence,
    stock_quantity: rand(1..100)
  )
end

20.times do
  Order.create(
    customer_id: rand(1..10),
    order_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
    status: ["pending", "shipped", "delivered"].sample,
    total_price: Faker::Commerce.price
  )
end
