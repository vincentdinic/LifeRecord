class CalendarsController < ApplicationController
  def show
    @events = @current_family.events.includes(:users)
    @event = @current_family.events.build
  end
end
