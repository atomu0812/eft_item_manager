class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user

    redirect_to items_path, notice: "ゲストユーザーとしてログインしました。", status: :see_other
  end

  def destroy
    guest_user = current_user if current_user&.guest?

    signed_out =
      if Devise.sign_out_all_scopes
        sign_out
      else
        sign_out(resource_name)
      end

    guest_user&.destroy

    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?

    respond_to_on_destroy
  end
end