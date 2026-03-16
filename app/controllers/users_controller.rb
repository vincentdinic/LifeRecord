class UsersController < ApplicationController
  def show
    @user = @current_family.users.find_by(id: params[:id])
    if @user
      render :show
    else
      redirect_to @current_family, alert: "Error finding this user."
    end
  end
end
