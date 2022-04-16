class Item < ApplicationRecord

  has_one_attached :image
  has_many :order_details
  has_many :cart_items
  belongs_to :genres
end
