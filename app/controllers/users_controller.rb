class UsersController < ApplicationController
    before_action :ensure_params_exist, only: :create
    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
    # def create
    #     user = User.new user_params
    #     if user.save
    #         json_response "Success", true, { user: user }, :ok
    #    else
    #         json_response "Something went wrong.", false, { }, :unprocessable_entity
    #    end
    # end

    def show
        @users = User.all
        json_response "Success", true, { users: @users }, :ok
    end
  
    def index
        @user = User.find(params[:id])
        json_response "Success", true, { user: @user }, :ok
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :remember_me, :first_name, :last_name)
    end
  
    def ensure_params_exist
        return if params[:user].present?
        json_response "Missing params.", false, { }, :bad_request
    end

    def record_not_found
        json_response "User not found.", false, { }, :not_found
      end
  end