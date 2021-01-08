class SessionsController < ApplicationController
    def login
    end

    def create
        user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

        if !!user
            session[:user_id] = user.id
            redirect_to user
        else
            redirect to '/login'
        end

    end

    def facebook_create
      @user = User.find_or_create_by(email: auth['email']) do |u|
        u.name = auth['name']
        u.uid = auth['uid']
        u.password = SecureRandom.urlsafe_base64(5)
      end
        
      session[:user_id] = @user.id
        
      redirect_to '/'
    end
        

    def destroy 
        session[:user_id] = nil
        redirect_to '/'
    end

    private

  def auth
    request.env['omniauth.auth']["info"]
  end

end