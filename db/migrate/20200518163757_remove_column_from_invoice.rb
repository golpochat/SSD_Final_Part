class RemoveColumnFromInvoice < ActiveRecord::Migration[5.2]
  def change
    remove_column :invoices, :address, :string
  end
end
