class DeficitItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @selected_sort = params[:sort].to_s.strip
    @sort_options = [
      ["50音順", "kana"],
      ["不足数順", "deficit_quantity"],
      ["必要数順", "required_quantity"]
    ]

    @deficit_items = Item
      .includes(:user_items, :item_tasks, :item_hideouts)
      .select { |item| item.deficit_quantity_for(current_user).positive? }

    @deficit_items = sort_items(@deficit_items)
    @user_items_by_item_id = current_user.user_items.index_by(&:item_id)
  end

  private

  def sort_items(items)
    case @selected_sort
    when "deficit_quantity"
      items.sort_by { |item| [-item.deficit_quantity_for(current_user), item.name] }
    when "required_quantity"
      items.sort_by { |item| [-item.total_required_quantity, item.name] }
    when "kana"
      items.sort_by(&:name)
    else
      items.sort_by(&:name)
    end
  end
end