class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :verified_user
    
    def verified_user
        if !logged_in?
            redirect_to signin_path
        end
    end
    
    def logged_in?
        session[:user_id]
    end


end
