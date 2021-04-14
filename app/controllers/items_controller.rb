class ItemsController < ApplicationController
  before_action :move_to_signin, except: [:index, :show]

  def index
    # @items = Item.order("created_at DESC") //（メモ）商品表示機能で利用するかも
  end

  def new
    @item = Item.new
  end

  private
  def move_to_signin
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
