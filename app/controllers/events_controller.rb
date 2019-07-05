class EventsController < ApplicationController
  

  def new
    @event = Event.new
  end

  def index
    # @events = Event.all

    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def create
    @event = current_user.created_events.build(post_params)
    if @event.save
      EventAttendance.create(attendee_id: current_user.id, attended_event_id: @event.id)
      redirect_to events_path
    else
      render 'new'
    end

  end

  def show
    @event = Event.find(params[:id])
  end

  def attend
    @user = current_user
    @event = Event.find(params[:id])
    EventAttendance.create(attendee_id: @user.id, attended_event_id: @event.id)
    redirect_to events_path
  end
  private
    def post_params
      params.require(:event).permit(:description, :date)
    end

end
