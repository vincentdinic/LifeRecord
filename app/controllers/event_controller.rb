class EventController < ApplicationController
  before_action :set_family
  before_action :set_event, only: [ :show, :edit, :update, :destroy ]

  def index
    @events = @family.events
  end

  def new
    @event = @family.events.build
  end

  def create
    @event = @family.events.build(event_params)

    if @event.save
      redirect_to family_events_path(@family), notice: "Event created"
    else
      render :new
    end
  end

  private

  def set_family
    @family = current_user.families.find(params[:family_id])
  end

  def set_event
    @event = @family.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :start_time, :end_time, user_ids: [])
  end
end
