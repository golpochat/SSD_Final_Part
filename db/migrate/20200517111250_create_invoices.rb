class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :name
      t.string :address
      t.date :date_of_invoice
      t.boolean :invoice_status
      t.float :total_amount

      t.timestamps
    end
  end
end
