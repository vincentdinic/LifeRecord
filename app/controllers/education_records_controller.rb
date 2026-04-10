class EducationRecordsController < ApplicationController
  before_action :set_user, only: [ :index, :new, :create ]
  before_action :set_education_record, only: [ :show, :edit, :update, :destroy ]
  before_action :require_own_profile!, except: [ :show, :index ]

  def index
    @education_records = @user.education_records.order(start_date: :desc)
  end

  def new
    @education_record = @user.education_records.build
  end

  def create
    @education_record = @user.education_records.build(education_record_params)

    if @education_record.save
      redirect_to user_path(@user), notice: "Education record successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    @user = @education_record.user
  end

  def update
    if @education_record.update(education_record_params)
      redirect_to user_path(@education_record.user), notice: "Education record updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @education_record.destroy
    redirect_to user_path(@education_record.user), notice: "Education record deleted."
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_education_record
    @education_record = EducationRecord.find(params[:id])
  end

  def require_own_profile!
    user = @user || @education_record.user
    redirect_to root_path, alert: "Not authorized." unless current_user == user
  end

  def education_record_params
    params.require(:education_record).permit(
      :school_name, :field_of_study, :degree_type,
      :city, :state, :country,
      :start_date, :end_date, :current, :gpa
    )
  end
end
