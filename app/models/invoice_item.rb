class InvoiceItem < ApplicationRecord
  belongs_to :invoice

  validates :invoice_id, presence: true
  validates :item_id, presence: true
  validates :quantity, presence: true, numericality: true
  validates :amount, presence: true, numericality: true
end
