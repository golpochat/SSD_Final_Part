class RemoveColumnsFromInvoice < ActiveRecord::Migration[5.2]
  def change
    remove_column :invoices, :name, :string
  end
end
