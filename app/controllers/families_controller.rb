class FamiliesController < ApplicationController
  before_action :set_family, only: %i[ show edit update destroy ]

  # GET /families/1
  def show
  end

  # GET /families/new
  def new
    @family = Family.new
  end

  # GET /families/1/edit
  def edit
  end

  # POST /families
  def create
    @family = Family.new(family_params)

    if @family.save
      FamilyUser.create!(user: current_user, family: @family, role: :owner)
      redirect_to @family
    else
      render :new
    end
  end

  # PATCH/PUT /families/1
  def update
    if @family.update(family_params)
      redirect_to @family, notice: "Family was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /families/1
  def destroy
    @family.destroy

    redirect_to root_path, notice: "Family was successfully destroyed.", status: :see_other 
  end

  def join
    # if params[:join_code] is not nil it will convert to uppercase and find it in the database
    if params[:join_code].present?
      family = Family.find_by(join_code: params[:join_code].upcase)

      if family
        # creates the DB relationship
        FamilyUser.find_or_create_by!(user: current_user, family: family)
        redirect_to family, notice: "Successfully joined #{family.name}"
      else
        redirect_to join_families_path, alert: "The join code is invalid."
      end
    else
      # it's a get request for the form if the join code isn't present
      render :join
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = current_user.families.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def family_params
      params.expect(family: [ :name ])
    end
end
