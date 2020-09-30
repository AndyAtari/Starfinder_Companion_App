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
          flash.now[:alert] = 'Invalid email/password combination'
          render 'new'
        end
    end

    def omniauth
      user = User.from_omniauth(auth)
      if user.valid?
        session[:user_id] = user.id
        redirect_to '/'
      else  
        redirect_to signin_path
      end
    end

    def destroy
      session.delete(:user_id)
      flash[:notice] = 'You have successfully signed out. Live long and prosper.'
      redirect_to signin_path
    end
  
    private

    def auth
      request.env['omniauth.auth']
    end

end
