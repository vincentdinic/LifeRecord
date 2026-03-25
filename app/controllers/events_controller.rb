class EventsController < ApplicationController
  before_action :set_family
  before_action :set_event, only: [ :show, :edit, :update, :destroy ]

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @events = @family.events
    respond_to do |format|
      format.json do
        render json: @events.map { |event|
          {
            id: event.id,
            title: event.title,
            description: event.description,
            start: event.start_time,
            end: event.end_time
          }
        }
      end
    end
  end

  def create
    @event = @family.events.build(event_params)

    if @event.save
      redirect_to family_calendar_path(@family), notice: "Event created"
    else
      @events = @family.events.includes(:users)
      render "calendars/show", status: :unprocessable_entity
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
    params.require(:event).permit(:title, :description, :start_time, :end_time, user_ids: [])
  end
end
