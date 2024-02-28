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
require "open-uri"

#users
Transaction.destroy_all
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
user8 = User.create!(
  first_name: 'Test',
  last_name: 'Test',
  address: 'testtest',
  email: 'test@test.com',
  password: 'testtest'
)

# products

file = URI.open("https://source.unsplash.com/random/?clothes")
product1 = Product.new(
  user: user1,
  name: 'Product 1',
  price: 50,
  status: false,
  brand: 'Hollister',
  condition: 'As new',
  location: 'Amsterdam, The Netherlands',
  description: 'Description of Product 1')
product1.photo.attach(io: file, filename: "nes.png")
product1.save

file2 = URI.open("https://source.unsplash.com/random/?clothes")
product2 = Product.new(
  user: user2,
  name: 'Laheys Liquor',
  price: 20,
  status: false,
  brand: 'Mr. Lahey',
  condition: 'As new',
  location: 'Roma,Italy',
  description: "A bottle of Mr. Lahey's finest liquor.")

product2.photo.attach(io: file2, filename: "nes.png")
product2.save

file3 = URI.open("https://source.unsplash.com/random/?clothes")
product3 = Product.new(
  user: user1,
  name: 'Sunnyvale Trailer Park T-Shirt',
  price: 15,
  status: false,
  brand: 'Nike',
  condition: 'As new',
  location: 'Groningen, The Netherlands',
  description: 'Official Sunnyvale Trailer Park merchandise.')

product3.photo.attach(io: file3, filename: "nes.png")
product3.save

file4 = URI.open("https://source.unsplash.com/random/?clothes")
product4 = Product.new(
  user: user5,
  name: 'Rickys Coins',
  price: 10,
  status: false,
  brand: 'stradivaruis',
  condition: 'worn out',
  location: 'Paris, France',
  description: "Authentic coins made by Ricky. Don't ask how."
)
product4.photo.attach(io: file4, filename: "nes.png")
product4.save

file5 = URI.open("https://source.unsplash.com/random/?clothes")
product5 = Product.new(
  user: user4,
  name: 'Bubbles Kitties Calendar',
  price: 12,
  status: false,
  brand: 'Hollister',
  condition: 'second hand',
  location: 'Rotterdam, The Netherlands',
  description: "A calendar featuring Bubbles' beloved kitties."
)
product5.photo.attach(io: file5, filename: "nes.png")
product5.save

file6 = URI.open("https://source.unsplash.com/random/?clothes")
product6 = Product.new(
  user: user2,
  name: 'Julians Rum and Coke Kit',
  price: 30,
  status: false,
  brand: 'Zara',
  condition: 'As new',
  location: 'Amsterdam, The Netherlands',
  description: 'Everything you need to mix Julian’s signature drink.'
)
product6.photo.attach(io: file6, filename: "nes.png")
product6.save

#transactions

Transaction.create!(
  product: product5,
  user: user1,
  pick_up_date: Date.today.to_s
)
