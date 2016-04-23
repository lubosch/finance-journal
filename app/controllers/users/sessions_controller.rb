class Users::SessionsController < Devise::SessionsController
  # DELETE /resource/sign_out
  def destroy
    DeviseLog.log(current_user, 'log_out')
    current_user.update(unique_session_id: nil)
    super
  end
end