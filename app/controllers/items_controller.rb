class ItemsController < ApplicationController
  def index
    @q = params[:q].to_s.strip
    @selected_level_range = params[:level_range].to_s.strip
    @selected_sort = params[:sort].to_s.strip
    @level_ranges = [10, 20, 30, 40, 50, 60, 70]
    @sort_options = [
      ["アイテム名順", "name"],
      ["必要数順", "required_quantity"],
      ["タスク必要数順", "task_required_quantity"],
      ["ハイドアウト必要数順", "hideout_required_quantity"]
    ]

    @items = Item
      .search_by_name(@q)
      .includes(item_tasks: :task, item_hideouts: :hideout)
      .order(:name)
      .to_a

    if @selected_level_range.present?
      level = @selected_level_range.to_i
      @items = @items.select { |item| item.total_required_quantity_up_to_level(level).positive? }
    end

    @items = sort_items(@items)

    if user_signed_in?
      @user_items_by_item_id = current_user.user_items.index_by(&:item_id)
    else
      @user_items_by_item_id = {}
    end
  end

  def show
    @item = Item.includes(:item_tasks, :tasks, :item_hideouts, :hideouts).find(params[:id])
  end

  private

  def sort_items(items)
    case @selected_sort
    when "required_quantity"
      items.sort_by do |item|
        selected_level = @selected_level_range.present? ? @selected_level_range.to_i : nil
        quantity =
          if selected_level.present?
            item.total_required_quantity_up_to_level(selected_level)
          else
            item.total_required_quantity
          end
        [-quantity, item.name]
      end
    when "task_required_quantity"
      items.sort_by do |item|
        quantity =
          if @selected_level_range.present?
            item.task_required_quantity_up_to_level(@selected_level_range.to_i)
          else
            item.task_required_quantity
          end
        [-quantity, item.name]
      end
    when "hideout_required_quantity"
      items.sort_by { |item| [-item.hideout_required_quantity, item.name] }
    else
      items.sort_by(&:name)
    end
  end
end