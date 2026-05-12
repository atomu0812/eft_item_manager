class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def require_admin!
    unless user_signed_in? && current_user.admin?
      redirect_to root_path, alert: "管理者のみアクセスできます。"
    end
  end
end