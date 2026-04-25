class ItemsController < ApplicationController
  def index
    @q = params[:q].to_s.strip

    @items = Item
      .search_by_name(@q)
      .includes(:item_tasks, :tasks, :item_hideouts, :hideouts)
      .order(:name)

    if user_signed_in?
      @user_items_by_item_id = current_user.user_items.index_by(&:item_id)
    else
      @user_items_by_item_id = {}
    end
  end

  def show
    @item = Item.includes(:item_tasks, :tasks, :item_hideouts, :hideouts).find(params[:id])
  end
end
