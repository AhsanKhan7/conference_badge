class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [ :show ]
  def index
    @events = current_user.events.order(date: :desc)
  end

  def show
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      redirect_to @event, notice: "Event created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = current_user.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :date, :location)
  end
end
