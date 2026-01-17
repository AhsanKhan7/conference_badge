class AttendeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def index
    @attendees = @event.attendees.order(:full_name)
  end

  def new
    @attendee = @event.attendees.new
  end

  def create
    @attendee = @event.attendees.new(attendee_params)

    if @attendee.save
      redirect_to event_attendees_path(@event), notics: "Attendee Added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = current_user.events.find(params[:event_id])
  end

  def attendee_params
    params.require(:attendee).permit(:full_name, :company, :role, :email)
  end
end
