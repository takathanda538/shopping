class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(params_item)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(params_item)
    redirect_to admin_item_path(@item)
  end

  private

  def params_item
    params.require(:item).permit(:name, :genre_id, :introduction, :price, :is_active)
  end

end
