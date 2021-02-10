class EventsController < ApplicationController
  def index
    @events = Event.all
    events = Event.all
  end

  def new
    # @event = Event.find(params[:id])
    @event = Event.new
  end

  def create
    if @event = Event.create(event_params)
      redirect_to template: "memos/index.html.erb"
    else
      render :new
    end
  end

  def show
    event = Event.find(params[:id])
  end
  
  
  
  private
  def event_params
    params.require(:event).permit(:title, :start_time, :plan).merge(user_id: current_user.id)
  end
end
