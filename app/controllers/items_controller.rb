class ItemsController < ApplicationController
  before_action :set_item, only:[:purchase, :pay, :destroy, :show, :edit, :update]

  def index
    @items = Item.all.includes(:user)
  end

  def purchase
    redirect_to new_card_path if current_user.card == nil
  end

  def new
    @item = Item.new
    @item.images.new
    @category_parent_array = ["---"]
    @category_parent_array = Category.where(ancestry: nil)
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
    @item = Item.find(params[:id])
    @category_id = @item.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end

  def edit
    @item = Item.find(params[:id])
    @grandchild_category = @item.category
    @child_category = @grandchild_category.parent 
    @category_parent = @child_category.parent
    @category_children = @item.category.parent.parent.children
    @category_grandchildren = @item.category.parent.children
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      @item.images = Item.find(params[:id]).images
      @grandchild_category = @item.category
      @child_category = @grandchild_category.parent 
      @category_parent = @child_category.parent
      @category_children = @item.category.parent.parent.children
      @category_grandchildren = @item.category.parent.children
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

  def get_category_children
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
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
    @item.update(buyer_id: current_user.id)
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

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

  protected
 
  def nonlogin_user
    unless current_user
      redirect_to root_path
    end
  end
end
