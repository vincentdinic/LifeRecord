class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [ :show, :edit, :update, :destroy ]

  def index
    @vehicles = @current_family.vehicles
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = @current_family.vehicles.build(vehicle_params)

    if @vehicle.save
      @vehicles = @current_family.vehicles
      redirect_to family_vehicles_path(@current_family), notice: "Vehicle successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to family_vehicle_path(@current_family, @vehicle), notice: "Vehicle was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @vehicle.destroy!
    redirect_to family_vehicles_path(@current_family), notice: "Vehicle was successfully deleted", status: :see_other
  end

  def edit
  end

  def show
  end

  private

    def set_vehicle
      @vehicle = @current_family.vehicles.find(params[:id])
    end

    def vehicle_params
      params.expect(vehicle: [ :make, :model, :year, :color, :nickname,
                               :vin, :license_plate, :fuel_type, :vehicle_type,
                               :current_value, :purchase_price, :purchase_date, :image ])
    end
end
