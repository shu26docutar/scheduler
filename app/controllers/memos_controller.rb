class MemosController < ApplicationController

    before_action :set_room, only: [:index, :edit, :update,]

    def index
        @rooms = Room.all
        @events = Event.all
        @memo = Memo.new
        @event = Event.new

    end

    def create
        @room = Room.find(params[:room_id])
        @memos = @room.memos.new(memo_params)
        if @memos.save
          redirect_to room_memos_path(@room)
        else
            render :index
        end
    end

    def edit
    end
    
    
    def update
        @memos.update!(memo_params)
        redirect_to request.referer(memo_params)
    end
    
    private 
    def memo_params
        params.require(:memo).permit(:content).merge(user_id: current_user.id)
    end

    def set_room
        @room = Room.find(params[:room_id])
        @memos = @room.memos.includes(:user)
    end
end
