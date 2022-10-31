class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  # 購入を確定します
  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(params_order)
    @order.shipping_cost = @shipping_cost 
    if @order.save
      cart_items.each do |cart|
        order_detile = OrderDetil.new
        order_detile.item_id = cart.item_id
        order_detile.order_id = @order.id
        order_detile.price = cart.sum_of_price
        order_detile.amount = cart.amount
        order_detile.save
      end
      @order.customer.cart_items.destroy_all
      redirect_to thanks_path
    end
  end

  def index
  end

  def show
  end

  def error
  end

  def confirm
    @order = Order.new(params_order)
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @order.payment_method = params_order[:payment_method]
    
    if params[:order][:selected_address] == "0"
      @order.name = current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      
    elsif params[:order][:selected_address] == "1"
      @selected_address = current_customer.addresses.find(params[:address_id])
      @order.get_shipping_informations_from(@selected_address)
      
    elsif params[:order][:address_number] == "2"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save
      else
      render :new
      end
      
    else
      redirect_to root_path
    end
    
  end

  def thanks
  end

  private

  def params_order
  params.require(:order).permit(:postal_code, :address, :name, :payment_method)
  end
  
  def address_params
  params.require(:order).permit(:name, :address)
  end
  
  def set_shipping_cost
    @shipping_cost = 800
  end


end
