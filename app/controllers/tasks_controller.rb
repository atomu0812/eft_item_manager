class TasksController < ApplicationController
  def index
    @tasks = Task.order(:name)
  end

  def show
    @task = Task.includes(item_tasks: :item).find(params[:id])
    @item_tasks = @task.item_tasks.sort_by { |item_task| item_task.item.name }
  end
end