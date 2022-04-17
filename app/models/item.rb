class Item < ApplicationRecord

  has_one_attached :image
  has_many :order_details
  has_many :cart_items
  belongs_to :genre

  # enum is_active: { go: 0, no_go: 1 }
end
