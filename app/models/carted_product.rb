class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :order, optional: true
  has_many :products, through: :users
end
