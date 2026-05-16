class Users::PasswordsController < Devise::PasswordsController
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)

    if resource.errors.empty?
      flash[:notice] = I18n.t("devise.passwords.send_instructions")
    else
      flash[:notice] = I18n.t("devise.passwords.send_paranoid_instructions")
    end

    respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
  rescue StandardError => e
    Rails.logger.error("[Password reset mail delivery error] #{e.class}: #{e.message}")

    self.resource = resource_class.new(resource_params)
    flash.now[:alert] = I18n.t("devise.passwords.delivery_failed")

    render :new, status: :unprocessable_entity
  end
end