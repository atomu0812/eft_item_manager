class UserItemsController < ApplicationController
  before_action :authenticate_user!

  def update
    user_item = current_user.user_items.find_or_initialize_by(item_id: params[:item_id])

    if user_item.update(user_item_params)
      redirect_to items_path, notice: "所持数を更新しました"
    else
      redirect_to items_path, alert: "所持数の更新に失敗しました"
    end
  end

  private

  def user_item_params
    params.require(:user_item).permit(:quantity)
  end
end