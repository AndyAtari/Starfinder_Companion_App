class SessionsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create, :omniauth]
    
    def new
        @user = User.new
    end
  
    def create
        @user = User.find_by(email: params[:email])
        if @user.try(:authenticate, params[:password])
          session[:user_id] = @user.id
          redirect_to '/'
        else  
          render 'new'
        end
    end

    def omniauth
      user = User.from_omniauth(auth)
      if user
        session[:user_id] = user.id
        redirect_to '/'
      else  
        redirect_to signin_path
      end
    end

    def destroy
      session.delete(:user_id)
      redirect_to '/'
    end
  
    private

    def auth
      request.env['omniauth.auth']
    end

end
