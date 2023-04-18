class Product < ApplicationRecord
  # validates :name, presence: true
  # validates :price, presence: true
  # validates :description, presence: true
  # validates :description, length: { minimum: 10 }

  belongs_to :supplier
  has_many :images
  has_many :orders

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def is_discounted?
    if price > 10
      return false
    else
      return true
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
