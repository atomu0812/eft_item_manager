class TasksController < ApplicationController
  def index
    @tasks = Task.order(:name)
  end

  def show
    @task = Task.includes(item_tasks: :item).find(params[:id])
  end
end