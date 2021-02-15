class EventsController < ApplicationController
  before_action :ser_event, onlu: [:show, :destroy]
  def index
    @events = Event.all
    events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    if @event = Event.create(event_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def update
  end
  

  def destroy
      @event.destroy
      redirect_to root_path
  end

  private
  def event_params
    params.require(:event).permit(:title, :start_time, :plan, :comment, :place, :url).merge(user_id: current_user.id)
  end

  def ser_event
    @event = Event.find(params[:id])
  end
end
