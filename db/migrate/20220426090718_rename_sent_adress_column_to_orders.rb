class RenameSentAdressColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :sent_adress, :sent_address
  end
end
