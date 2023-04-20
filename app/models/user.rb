class User < ApplicationRecord
  # Associatations
  has_many :orders
  has_many :carted_products

  # Auth Code
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
