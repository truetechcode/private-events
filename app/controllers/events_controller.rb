class EventsController < ApplicationController
  

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = current_user.created_events.build(post_params)
    if @event.save
      redirect_to events_path
    else
      render 'new'
    end

  end

  def show
    @event = Event.find(params[:id])
  end

  private
    def post_params
      params.require(:event).permit(:description)
    end

end
