class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer "customer_id"
      t.string "sent_code"
      t.string "sent_adress"
      t.string "sent_name"
      t.integer "postage"
      t.integer "payment"
      t.integer "payment_method"
      t.integer "orders_status"
     
      t.timestamps
    end
  end
end
