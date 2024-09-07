class Product < ApplicationRecord
  has_many :line_items
  validates :name, :description, :quantity, :price, presence: true

  def low_stock?
    quantity < 5 # Set the threshold as needed
  end
end
