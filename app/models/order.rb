class Order < ApplicationRecord

  has_many :order_details
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum orders_status: { "入金待ち": 0, "入金確認": 1, "制作中": 2, "発送準備中": 3, "発送済み": 4 }
  # enum orders_status: { waiting: 0, confirmation: 1, making: 2, preparing: 3, done: 4 }
  # 入金待ち：０、入金確認：１、制作中：２、発送準備中：３，発送済み：４
  def subtotal
    item.with_tax_price * amount
  end

  def with_tax_price
    (price * 1.1).floor
  end

end
