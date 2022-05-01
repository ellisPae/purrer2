class UsersController < ApplicationController

    def index
        @users = User.all
        render :index
    end

    def show
        @user = User.find(params[:id])
        render :profile
    end
    
    def create
        @user = User.new(user_params)
    
        if @user.save
            login(@user)
            render :home
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    
    
    
    private 

    def user_params
        params.require(:user).permit(:email, :password :handle, :name, :phone_number, :dob, :bio)
    end





end
