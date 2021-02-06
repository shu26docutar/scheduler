class MemosController < ApplicationController

    def index
        @rooms = Room.all
        @memo = Memo.all
        @events = Event.all
        @memo = Memo.new
        @event = Event.new
        @room = Room.find(params[:room_id])
        @memos = @room.memos.includes(:user)
    end

    def create
        # @event = Event.find_by(id: parans[:room_id])
        @room = Room.find(params[:room_id])
        @memo = @room.memos.new(memo_params)
        if @memo.save
          redirect_to room_memos_path(@room)
        else
            render :index
        end
    end

    private 
    def memo_params
        params.require(:memo).permit(:content).merge(user_id: current_user.id)
    end
end
