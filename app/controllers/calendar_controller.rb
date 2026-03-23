class CalendarController < ApplicationController
  def show
    @family = current_user.families.find(params[:family_id])
    @events = @family.events.includes(:users)
  end
end
