class ItemsController < ApplicationController
  def index
    @items = Item.all

    if user_signed_in?
      @user_items_by_item_id = current_user.user_items.index_by(&:item_id)
    else
      @user_items_by_item_id = {}
    end
  end

  def show
    @item = Item.find(params[:id])
  end
end