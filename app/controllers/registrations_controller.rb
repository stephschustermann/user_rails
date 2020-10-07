class RegistrationsController < Devise::RegistrationsController
    before_action :ensure_params_exist, only: :create
  # sign up
  def create
    user = User.new user_params
    puts user.inspect
    if user.save!
      json_response "Signed Up successfully", true, {user: user}, :ok
    else
      puts user.inspect
      json_response "Something wrong", false, {}, :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end

  def ensure_params_exist
    return if params[:user].present?
    json_response "Missing Params", false, {}, :bad_request
  end
end