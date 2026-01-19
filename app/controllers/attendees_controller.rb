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

  def destroy
    attendee = @event.attendees.find(params[:id])

    if attendee.destroy
      redirect_to event_attendees_path(@event), notice: "Attendee Removed"
    else
      redirect_to event_attendees_path(@event), alert: "Something went wrong"
    end
  end

  def badge
    attendee  = @event.attendees.find(params[:id])
    pdf = BadgePdfGenerator.new(attendee).render

    send_data pdf,
      filename: "badge-#{attendee.full_name.parameterize}.pdf",
      type: "application/pdf",
      disposition: "inline"
  end

  private

  def set_event
    @event = current_user.events.find(params[:event_id])
  end

  # Brakeman false positive:
  # params are explicitly permitted and scoped to @event
  # brakeman:ignore PermitAttributes
  def attendee_params
    params.require(:attendee).permit(
      :full_name,
      :company,
      :role,
      :email
    )
  end
end
