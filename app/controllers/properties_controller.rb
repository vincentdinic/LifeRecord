class PropertiesController < ApplicationController
  before_action :set_property, only: [ :show, :edit, :update, :destroy ]
  def index
    @properties = @current_family.properties
  end

  def new
    @property = Property.new
  end

  def create
    @property = @current_family.properties.build(property_params)

    if @property.save
      @properties = @current_family.properties
      redirect_to family_properties_path(@current_family), notice: "Property was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @property.update(property_params)
      redirect_to family_property_path(@current_family, @property), notice: "Property was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @property.destroy!
    redirect_to family_properties_path(@current_family), notice: "Property was successfully destroyed.", status: :see_other
  end

  def edit
  end

  def show
  end

  private

  def set_property
    @property = @current_family.properties.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def property_params
    params.expect(property: [ :name,
                              :description,
                              :street,
                              :unit,
                              :city,
                              :state,
                              :zip_code,
                              :country ])
  end
end
