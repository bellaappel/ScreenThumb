class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    def index
        @users = User.all
    end

    def show
    end

    def new
        @user = User.new
    end

    def edit
    end

    def create
        @user = User.new(user_params)
        if user.password == user.password_confirmation
            @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new, notice: "You're passwords don't match!"
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