class HomeController < ApplicationController
  # skips authentication since non-logged in users can see this page
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    if user_signed_in?
      @families = current_user.families
      # If a user has no families yet, create one
      if current_user.families.empty?
        # redirect_to onboarding_path
        render :onboarding
      else
        redirect_to family_path(@current_family)
      end
    # If a user is not logged in, render an intro page
    else
      render :index
    end
  end
end
