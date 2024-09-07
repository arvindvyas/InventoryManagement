class Product < ApplicationRecord
  has_many :line_items
  validates :name, :description, :quantity, :price, presence: true
end
