class Invoice < ApplicationRecord
	has_many :invoice_items, dependent: :delete_all
	belongs_to :user
	validates :date_of_invoice, presence: true
	validates :status, presence:true
end
