class Users::RegistrationsController < Devise::RegistrationsController
  before_action :redirect_guest_user, only: %i[edit update destroy]

  private

  def redirect_guest_user
    return unless current_user&.guest?

    redirect_to root_path, alert: "ゲストユーザーはユーザー情報を編集できません。"
  end
end