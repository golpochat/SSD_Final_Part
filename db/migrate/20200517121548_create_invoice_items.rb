class CreateInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_items do |t|
      t.integer :quantity
      t.float :amount
      t.references :invoice, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
