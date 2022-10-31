class CartItem < ApplicationRecord
  
  belongs_to :item
  belongs_to :customer
  
  def sum_of_price
    item.price * amount.to_i
  end 
  
end
