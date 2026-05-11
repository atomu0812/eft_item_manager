class ItemsController < ApplicationController
  def index
    @q = params[:q].to_s.strip
    @selected_level_range = params[:level_range].to_s.strip
    @level_ranges = [10, 20, 30, 40, 50, 60, 70]

    @items = Item
      .search_by_name(@q)
      .includes(item_tasks: :task, item_hideouts: :hideout)
      .order(:name)

    if @selected_level_range.present?
      level = @selected_level_range.to_i
      @items = @items.select { |item| item.total_required_quantity_up_to_level(level).positive? }
    end

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