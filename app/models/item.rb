class Item < ApplicationRecord
  belongs_to :genre
  
  has_many :post_images, dependent: :destroy
  has_many :order_items, dependent: :destroy
  
end
