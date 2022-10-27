class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params_item)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :genre_id, :introduction, :price, :is_active)
  end

end
