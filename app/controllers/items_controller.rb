class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.images.new
  end

  def create
   @item = Item.new(item_params)
   @item.save
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :text, :condition_id, :category_id, :burden_id, :area_id, :shipping_date_id, :price, images_attributes: [:src])
  end
end
