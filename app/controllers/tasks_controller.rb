class TasksController < ApplicationController
  def index
    @tasks = Task.order(:name)
  end

  def show
    @task = Task.find(params[:id])
  end
end