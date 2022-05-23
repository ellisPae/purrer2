class PurrsController < ApplicationController
    
    before_action :authenticate_user!, only: %w(create edit update destroy)

    def index    
        @purrs = Purr.all
        render :index
    end
    
    def show
        @purr = Purr.find(params[:id])
        render :show
    end

    def new
    end

    def create
        @purr = Purr.new(purr_params)
        @purr.user_id = current_user.id

        if(@purr.save)
            render :show
        else
            render json @purrs.errors.full_messages, status: 422
        end
    end

    def edit
        @purr = purr.find(params[:id])
        @purr.user_id = current_user.id
        
        if @purr.update(purr_params)
            render "api/purrs/show"
        else
            flash[:errors] = @purr.errors.full_messages
        end
    end

    def update
        @purr = Purr.find(params[:id])
        @purr.artist_id = current_user.id
        
        if @purr.update(purr_params)
            render "api/purrs/show"
        else
            flash[:errors] = @purr.errors.full_messages
        end
    end

    def destroy
        @purr = current_user.purrs.find_by(id: params[:id])
        @purr.delete if @purr && @purr.artist_id == current_user.id
        render "api/users/show"
    end

 

    private

    def purr_params
        params.require(:purr).permit(:user_id, :content, :original_purr_id)
    end
end
