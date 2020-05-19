json.extract! invoice, :id, :name, :address, :date_of_invoice, :invoice_status, :total_amount, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
