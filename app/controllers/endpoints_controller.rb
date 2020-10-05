class EndpointsController < ApplicationController
    before_action :ensure_params_exist, only: :create
    def create
        user = User.new user_params
        if user.save
            render json: {
                messages: "Success",
                is_success: true,
                data: {
                    user: user
                }
            }, status: :ok
       else
            render json: {
                messages: "Something went wrong.",
                is_success: false,
                data: {}
            }, status: :unprocessable_entity
       end
    end

    def all
        @users = User.all
        #users_serializer = parse_json @users
        render json: {
                messages: "Success",
                is_success: true,
                data: {
                    users: @users
                }
        }, status: :ok
    end
  
    def findById
        @user = User.find(params[:id])
        if @user
            render json: {
                messages: "Success",
                is_success: true,
                data: {
                    user: @user
                }
            }, status: :ok
        else
            render json: {
                messages: "User not found",
                is_success: false,
                data: {}
            }, status: :not_found
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :first_name, :last_name)
    end
  
    def ensure_params_exist
        return if params[:user].present?
        render json: {
            messages: "Missing params",
            is_success: false,
            data: {}
        }, status: :bad_request
    end
  end