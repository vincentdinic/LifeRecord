class MaintenanceRecordsController < ApplicationController
  before_action :set_parent, only: [ :index, :new, :create ]
  before_action :set_maintenance_record, only: [ :show, :edit, :update, :destroy ]

  def index
    @maintenance_records = @parent.maintenance_records.order(performed_on: :desc)
  end

  def new
    @maintenance_record = @parent.maintenance_records.build
  end

  def create
    @maintenance_record = @parent.maintenance_records.build(maintenance_record_params)
    @maintenance_record.created_by = current_user

    if @maintenance_record.save
      redirect_to polymorphic_path([ @current_family, @parent ]),
        notice: "Maintenance record successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    @parent = @maintenance_record.maintainable
  end

  def update
    if @maintenance_record.update(maintenance_record_params)
      redirect_to polymorphic_path([ @current_family, @maintenance_record.maintainable ]), notice: "Maintenance record successfullyupdated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @maintenance_record.destroy
    redirect_to polymorphic_path([ @current_family, @maintenance_record.maintainable ]), notice: "Maintenance record successfully deleted."
  end

  private

  def set_parent
    if params[:property_id]
      @parent = @current_family.properties.find(params[:property_id])
    end
  end

  def set_maintenance_record
    @maintenance_record = MaintenanceRecord.find(params[:id])
  end

  def maintenance_record_params
    params.require(:maintenance_record).permit(:title, :description, :performed_on, :cost, :contractor)
  end
end
