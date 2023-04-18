class User < ApplicationRecord
  # Associatations

  has_many :orders

  # Auth Code
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
