class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    def index
        @users = User.all
    end
    
    def show
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
      redirect_to '/signup', notice: "Oops something isn't right"
    end
  end


    def edit
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
        if @user.update(user_params)
            redirect to @user
        else 
            render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to '/', notice: 'Logged out!'
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end   
end