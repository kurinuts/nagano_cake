class Item < ApplicationRecord

  has_one_attached :image
  has_many :order_details
  has_many :order
  has_many :cart_items
  belongs_to :genre
  
  # add_column :is_active, :notification_allowed, :boolean, default: false, null: false
  validates :is_active, inclusion: { in: [true, false] }
  # enum is_active: { go: 0, no_go: 1 }
  def with_tax_price
    (price * 1.1).floor
  end
end
