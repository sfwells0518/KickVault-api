class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products

  # Calculations for subtotal, tax and total:

  # def subtotal
  #   quantity * price
  # end

  # def tax
  #   subtotal * 0.09
  # end

  # def total
  #   subtotal + tax
  # end
end
