class TasksController < ApplicationController
  def index
    @selected_trader = params[:trader].to_s.strip
    @traders = Task.where.not(trader: [nil, ""]).distinct.order(:trader).pluck(:trader)

    @tasks = Task.order(:name)
    @tasks = @tasks.where(trader: @selected_trader) if @selected_trader.present?
  end

  def show
    @task = Task.includes(item_tasks: :item).find(params[:id])
    @item_tasks = @task.item_tasks.sort_by { |item_task| item_task.item.name }
  end
end