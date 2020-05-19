class AddColumnsToInvoice < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :user_id, :integer
  end
end
