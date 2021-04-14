class ItemsController < ApplicationController
  before_action :move_to_signin, except: [:index, :show]

  def index
    # @items = Item.order("created_at DESC") //（メモ）商品表示機能で利用するかも
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def move_to_signin
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :image, :category_id, :condition_id, :shipping_charge_id, :shipping_source_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end