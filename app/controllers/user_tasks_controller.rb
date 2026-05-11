class UserTasksController < ApplicationController
  before_action :authenticate_user!

  def update
    task = Task.find(params[:task_id])
    user_task = current_user.user_tasks.find_or_initialize_by(task: task)
    user_task.completed = ActiveModel::Type::Boolean.new.cast(user_task_params[:completed])
    user_task.save!

    redirect_to tasks_path(trader: params[:trader], level: params[:level], status: params[:status]), notice: "タスク進行状況を更新しました。"
  end

  private

  def user_task_params
    params.require(:user_task).permit(:completed)
  end
end