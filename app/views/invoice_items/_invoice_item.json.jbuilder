json.extract! invoice_item, :id, :quantity, :amount, :invoice_id, :item_id, :created_at, :updated_at
json.url invoice_item_url(invoice_item, format: :json)
