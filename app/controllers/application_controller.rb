class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
  before_action :authenticate_user!
  before_action :set_current_family

  def set_current_family
    return unless current_user

    families = current_user.families
    if families.empty?
      session[:family_id] = nil
      @current_family = nil
      return
    end

    @current_family = families.find_by(id: session[:family_id]) || families.first
    session[:family_id] = @current_family.id
  end
end
