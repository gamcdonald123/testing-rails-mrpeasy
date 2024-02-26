10.times do
  Customer.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    address: Faker::Address.full_address
  )
end

20.times do
  Item.create!(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    description: Faker::Lorem.sentence,
    stock_quantity: rand(1..100)
  )
end

customer_ids = Customer.pluck(:id)
item_ids = Item.pluck(:id)

20.times do
  order = Order.create!(
    customer_id: customer_ids.sample, # This ensures you're using an existing customer ID
    order_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
    status: ["pending", "shipped", "delivered"].sample,
    total_price: Faker::Commerce.price
  )

  3.times do
    OrderItem.create!(
      name: Faker::Commerce.product_name,
      order_id: order.id,
      item_id: item_ids.sample, # This ensures you're using an existing item ID
      quantity: rand(1..5),
      item_price_at_purchase: Faker::Commerce.price
    )
  end
end
