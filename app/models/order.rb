class Order < ApplicationRecord
  
  has_many :order_details
  belongs_to :customer
  
  enum payment_method: { credit_card: 0, transfar: 1 }
end
