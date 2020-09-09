class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.images.new
  end

  def create
   
  end

  private
  
  def item_params
    
  end
end
