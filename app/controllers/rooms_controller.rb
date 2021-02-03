class RoomsController < ApplicationController
    def index
    end

    def new
        @room = Room.new
    end

    def create
        if @room = Room.create(room_params)
           @room.users = [current_user]
           @rooms = Room.all.order(id: "DESC")
           redirect_to root_path
        else
            render :new
        end
    end
    
    private
    def room_params
        params.require(:room).permit(:name, user_ids: [current_user.id])
    end
end
