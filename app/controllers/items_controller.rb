class ItemsController < ApplicationController
  before_action :set_item, only:[:purchase, :pay, :destroy, :show, :edit, :update]

  def index
    @mens_items = Item.where(category_id:"2").includes(:user)
    @chanel_brands = Item.where(brand:"シャネル").includes(:user)
  end

  def purchase
    redirect_to new_card_path if current_user.card == nil
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.images = []
      @item.images.new
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update

    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
       redirect_to root_path
    else
      render :show
    end
  end

  def pay

    if current_user.card
    @card = Card.find_by(user_id: current_user.id)
    # = link_to '商品ページに戻る', item_path
    Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
      :amount => @item.price, #支払金額を引っ張ってくる
      :customer => @card.customer_id,  #顧客ID
      :currency => 'jpy',              #日本円
    )
    end
    redirect_to root_path #完了画面に移動
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :text, :condition_id, :category_id, :burden_id, :area_id, :shipping_date_id, :price, :brand, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


  protected

  def nonlogin_user
    unless current_user
      redirect_to root_path
    end
  end


end
