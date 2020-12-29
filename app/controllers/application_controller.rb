class ApplicationController < ActionController::Base
    helper_method :current_user, :user_is_logged_in?

    def current_user
        User.find_by_id(session[:user_id])
    end

    def user_is_logged_in?
        !!session[:user_id]
    end
        
    def home
        render '/home'
    end
end
