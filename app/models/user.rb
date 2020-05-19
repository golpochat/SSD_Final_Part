class User < ApplicationRecord
  has_secure_password
  has_many :invoices
  validates :email, presence: true, uniqueness: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :name, presence: true
  validates :address, presence: true
end
