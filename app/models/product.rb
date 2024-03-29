class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :transactions

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :description, presence: true, length: { minimum: 5 }
  validates :brand, presence: true
  validates :size, presence: true
  validates :condition, presence: true
end
