class EventsController < ApplicationController
  before_action :signed_in?, only: [:show, :new, :index, :create ]


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
      #EventAttendance.create(attendee_id: current_user.id, attended_event_id: @event.id)
      redirect_to events_path
    else
      render 'new'
    end

  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def signed_in?
    unless current_user
      redirect_to new_session_path, notice: 'you are not signed in!'
    end
  end

  def post_params
      params.require(:event).permit(:description, :date)
    end

end
