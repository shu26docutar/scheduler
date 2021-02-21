class RoomsController < ApplicationController
    
    before_action :authenticate_user!, only: [:new]

    def index
    end

    def new
        @room = Room.new
    end

    def create
        if @room = Room.create(room_params)
           @room.users = [current_user]
           @rooms = Room.all.order(id: "DESC")
           redirect_to room_memos_path(@room)
        else
            render :new
        end
    end

    def destroy
        @room = Room.find(params[:id])
        @room.destroy
        redirect_to root_path
    end
    
    private
    def room_params
        params.require(:room).permit(:name, user_ids: [current_user.id])
    end
end
