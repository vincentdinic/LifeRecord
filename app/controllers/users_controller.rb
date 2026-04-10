class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def show
    if @user
      render :show
    else
      redirect_to @current_family, alert: "Error finding this user."
    end
  end

  def edit
  end

  def destroy
    # TODO - Allow a user to delete their account
    # Might be good to require the transfer of family ownership before doing so
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def set_user
      @user = @current_family.users.find_by(id: params[:id])
    end

    def user_params
      params.expect(user: [ :first_name, :middle_name, :last_name, :birthday, :avatar ])
    end
end
