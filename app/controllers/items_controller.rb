class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    # ログインユーザーのIDを自動保存する処理が必要（ユーザー機能ができてから）
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :text, :condition_id, :category_id, :burden_id, :area_id, :shipping_date_id, :price, :brand, images_attributes: [:src, :_destroy, :id])
  end
end
