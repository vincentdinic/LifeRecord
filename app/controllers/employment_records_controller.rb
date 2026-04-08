class EmploymentRecordsController < ApplicationController
  before_action :set_user, only: [ :index, :new, :create ]
  before_action :set_employment_record, only: [ :show, :edit, :update, :destroy ]
  before_action :require_own_profile!, except: [ :show, :index ]

  def index
    @employment_records = @user.employment_records.order(start_date: :desc)
  end

  def new
    @employment_record = @user.employment_records.build
  end

  def create
    @employment_record = @user.employment_records.build(employment_record_params)

    if @employment_record.save
      redirect_to user_path(@user), notice: "Employment record successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    @user = @employment_record.user
  end

  def update
    if @employment_record.update(employment_record_params)
      redirect_to user_path(@employment_record.user), notice: "Employment record updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employment_record.destroy
    redirect_to user_path(@employment_record.user), notice: "Employment record deleted."
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_employment_record
    @employment_record = EmploymentRecord.find(params[:id])
  end

  def require_own_profile!
    user = @user || @employment_record.user
    redirect_to root_path, alert: "Not authorized." unless current_user == user
  end

  def employment_record_params
    params.require(:employment_record).permit(:company_name, :role, :department, :city, 
                                              :state, :country, :location_type, :employment_type,
                                              :employment_status, :salary_type, :salary,
                                              :pay_day, :start_date, :end_date, :current)
  end
end
