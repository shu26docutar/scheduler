class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    # @event = Event.find(params[:id])
    @event = Event.new
  end

  def create
    if @event = Event.create(event_params)
      redirect_to room_memos_path(@room_id)
    else
      render :new
    end
  end
  
  
  private
  def event_params
    params.require(:event).permit(:title, :first_time).merge(user_id: current_user.id)
  end
end
