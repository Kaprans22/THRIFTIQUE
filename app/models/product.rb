class Product < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :description, presence: true, length: { minimum: 10 }
  validates :image, presence: true
end
