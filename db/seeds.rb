# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

#users
Product.destroy_all
User.destroy_all
user1 = User.create!(
  first_name: 'John',
  last_name: 'Deer',
  address: 'Grove St',
  email: 'john@example.com',
  password: 'password'
)

user2 = User.create!(
  first_name: 'Julian',
  last_name: 'Smith',
  address: 'Sunnyvale Trailer Park',
  email: 'julian@example.com',
  password: 'rumandcoke'
)

user3 = User.create!(
  first_name: 'Ricky',
  last_name: 'Lahey',
  address: 'Trailer 2, Sunnyvale',
  email: 'ricky@example.com',
  password: 'conky123'
)

user4 = User.create!(
  first_name: 'Bubbles',
  last_name: 'McLovin',
  address: 'Kittyland',
  email: 'bubbles@example.com',
  password: 'kitties4life'
)

user5 = User.create!(
  first_name: 'Jim',
  last_name: 'Lahey',
  address: 'Supervisor Office, Sunnyvale',
  email: 'jim@example.com',
  password: 'liquoronmypiss'
)

user6 = User.create!(
  first_name: 'Randy',
  last_name: 'Bobandy',
  address: 'Trailer 6, Sunnyvale',
  email: 'randy@example.com',
  password: 'cheeseburgers'
)
user7 = User.create!(
  first_name: 'Trevor',
  last_name: 'Corry',
  address: '123 Julian St',
  email: 'TandC@example.com',
  password: 'JulianGOAT'
)

# products

product1 = Product.create!(
  user: user1,
  name: 'Product 1',
  price: 50,
  status: true,
  description: 'Description of Product 1'
)

product2 = Product.create!(
  user: user2,
  name: 'Laheys Liquor',
  price: 20,
  status: true,
  description: "A bottle of Mr. Lahey's finest liquor."
)

product3 = Product.create!(
  user: user1,
  name: 'Sunnyvale Trailer Park T-Shirt',
  price: 15,
  status: true,
  description: 'Official Sunnyvale Trailer Park merchandise.'
)

product4 = Product.create!(
  user: user5,
  name: 'Rickys Coins',
  price: 10,
  status: true,
  description: "Authentic coins made by Ricky. Don't ask how."
)

product5 = Product.create!(
  user: user4,
  name: 'Bubbles Kitties Calendar',
  price: 12,
  status: true,
  description: "A calendar featuring Bubbles' beloved kitties."
)

product6 = Product.create!(
  user: user2,
  name: 'Julians Rum and Coke Kit',
  price: 30,
  status: true,
  description: 'Everything you need to mix Julian’s signature drink.'
)

#transactions

Transaction.create!(
  product: product5,
  user: user1,
  pick_up_date: Date.today.to_s
)
