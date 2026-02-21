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
      current_user.families << @family
      redirect_to @family
    else
      render :new
    end
  end

  # PATCH/PUT /families/1
  def update
    respond_to do |format|
      if @family.update(family_params)
        format.html { redirect_to @family, notice: "Family was successfully updated.", status: :see_other }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /families/1
  def destroy
    @family.destroy!

    respond_to do |format|
      format.html { redirect_to families_path, notice: "Family was successfully destroyed.", status: :see_other }
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
