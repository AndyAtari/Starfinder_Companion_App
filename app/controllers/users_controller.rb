class UsersController < ApplicationController
    
    skip_before_action :verified_user, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
         @user = User.new(user_params)
         if @user.save
            session[:user_id] = @user.id
            redirect_to '/'
        else
            render 'new'
        end
    end


    private

    def user_params
        params.require(:user).permit(
            :user_name,
            :email,
            :password,
            :password_confirmation
        )
    end

end
