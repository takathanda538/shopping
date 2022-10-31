class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  
  def get_shipping_informations_from(resource)
    class_name = resource.class.name
    if class_name == 'Customer' # resource: Customer
      self.postal_code = resource.postal_code
      self.address= resource.address
      self.name = resource.first_name
    elsif class_name == 'Address' # resource: Address
      self.postal_code = resource.postal_code
      self.address = resource.address
      self.other_address = resource.other_address
      self.name = resource.name
    end
  end

  def create_order_details(customer)
    unless order_details.first
      cart_items = customer.cart_items.includes(:item)
      cart_items.each do |cart_item|
        item = cart_item.item
        OrderDetail.create!(
          order_id: id,
          item_id: item.id,
          price: item.with_tax_price,
          amount: cart_item.amount
        )
      end
      cart_items.destroy_all
    end
  end
end
