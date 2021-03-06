class UsersController < ApplicationController
    
    before_action :set_user, only: [:show, :edit]

    def show
    end

    def edit
    end

    def update
        @user = User.find(params[:id])
        if @user.update!(user_params)
            redirect_to user_path(user_params)
        else
            render :edit
        end
    end

    private
    def set_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:name, :password,:email, :name_kana)
    end
end
