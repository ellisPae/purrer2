class UsersController < ApplicationController

    def index
        @users = User.all
        render :index
    end

    def show
        @user = User.find(params[:id])
        render :profile
    end
    
    
    
    private 

    def user_params
        params.require(:user).permit(:email, :password :handle, :name, :phone_number, :dob, :bio)
    end





end
