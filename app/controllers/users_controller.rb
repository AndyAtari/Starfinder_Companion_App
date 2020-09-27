class UsersController < ApplicationController

    skip_before_action :verified_user, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        if (user = User.create(user_params))
            session[:user_id] = user.id
            redirect_to signin_path
        else
            render 'new'
        end
    end


    private

    def user_params
        params.require(:user).permit(
            :user_name,
            :email,
            :password
        )
    end

end
