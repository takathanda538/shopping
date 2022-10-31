class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
  
  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if CartItem.find_by(item_id: @cart_item.item_id)
      @update_cart_item = CartItem.find_by(item_id: @cart_item.item_id)
      # 追加の数量をカートに入っている数量に足す
      @cart_item.amount += @update_cart_item.amount
      @update_cart_item.destroy
    end

    if @cart_item.save
      redirect_to cart_items_path
    else
      flash[:notice] = "個数を選択してください。"
      redirect_back(fallback_location: root_path)
    end
    
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to redirect_back(fallback_location: root_path)
  end
  
  private
  
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
  
end
