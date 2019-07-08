class EventAttendanceController < ApplicationController
  # before_action :signed_in?, only: [:show, :new, :index, :create ]

  def attend
    @user = current_user
    @event = Event.find(params[:id])
    EventAttendance.create(attendee_id: @user.id, attended_event_id: @event.id)
    redirect_to events_path
  end

  private
  def signed_in?
    unless current_user
      redirect_to new_session_path, notice: 'you are not signed in!'
    end
  end

end
