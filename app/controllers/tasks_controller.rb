class TasksController < ApplicationController
  def index
    @selected_trader = params[:trader].to_s.strip
    @selected_level = params[:level].to_s.strip
    @selected_status = params[:status].to_s.strip

    @traders = Task.where.not(trader: [nil, ""]).distinct.order(:trader).pluck(:trader)
    @levels = Task.distinct.order(:level).pluck(:level)

    @tasks = Task.order(:name)
    @tasks = @tasks.where(trader: @selected_trader) if @selected_trader.present?
    @tasks = @tasks.where(level: ..@selected_level.to_i) if @selected_level.present?

    if user_signed_in?
      @user_tasks_by_task_id = current_user.user_tasks.index_by(&:task_id)

      case @selected_status
      when "completed"
        completed_task_ids = current_user.user_tasks.where(completed: true).pluck(:task_id)
        @tasks = @tasks.where(id: completed_task_ids)
      when "incomplete"
        completed_task_ids = current_user.user_tasks.where(completed: true).pluck(:task_id)
        @tasks = @tasks.where.not(id: completed_task_ids)
      end
    else
      @user_tasks_by_task_id = {}
    end
  end

  def show
    @task = Task.includes(item_tasks: :item).find(params[:id])
    @item_tasks = @task.item_tasks.sort_by { |item_task| item_task.item.name }
  end
end