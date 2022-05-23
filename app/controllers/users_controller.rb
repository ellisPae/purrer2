class UsersController < ApplicationController

    before_action :authenticate_user!, only: %w(edit update)

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
            sign_in(@user)
            render "devise/registrations/new"
        else
            render json: @user.errors.full_messages, status: 422
        end
    end
    
    
    
    private 

    def user_params
        params.require(:user).permit(:email, :password :handle, :name, :phone_number, :dob, :bio)
    end
end
