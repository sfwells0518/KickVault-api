class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

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
