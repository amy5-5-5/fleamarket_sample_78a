class ItemsController < ApplicationController

  def index
  end

  def purchase
  end

  def show
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    # ログインユーザーのIDを自動保存する処理が必要（ユーザー機能ができてから）
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_item_path
    else
      @item.images.new
      render :new
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :text, :condition_id, :category_id, :burden_id, :area_id, :shipping_date_id, :price, :brand, images_attributes: [:src])

  end
end
