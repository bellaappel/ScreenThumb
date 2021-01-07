class UsersController < ApplicationController
   
    def index
        @users = User.all
    end
    
    def show
        @user = User.find_by(id: params[:id])
    end

   def signup
        @user = User.new
   end

   def login
        @user = User.new
   end


    def create_session
        user = User.find_by(username: params[:user][:username])

        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user.id)
        else
            redirect_to '/login', notice: "Incorrect Login or Password!"
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
        if @user == current_user 
        else 
         redirect_to user_path(@user.id)
        end
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user.id)
        else
            redirect_to '/signup'
        end
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.update(user_params)
        redirect_to user_path(@user.id)
    end

    def destroy
        @user.destroy
        redirect_to '/', notice: 'Logged out!'
    end

    private
    def user_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :uid)
    end   
end