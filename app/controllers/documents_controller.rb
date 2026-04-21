class DocumentsController < ApplicationController
  before_action :set_parent, only: [ :index, :new, :create, :destroy ]
  before_action :set_document, only: [ :show, :edit, :update, :destroy ]
  helper_method :form_url

  def index
    @documents = @parent.documents.order(created_at: :desc)
  end

  def new
    @document = @parent.documents.build
  end

  def create
    @document = @parent.documents.build(document_params)
    @document.uploaded_by = current_user

    if @document.save
      redirect_to after_save_path, notice: "Document uploaded successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @document.destroy
    redirect_to after_save_path, notice: "Document successfully deleted.", status: :see_other
  end

  def edit
    @parent = @document.documentable
  end

  def update
    if @document.update(document_params)
      redirect_to document_path(@document), notice: "Document updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_parent
    if params[:property_id]
      @parent = @current_family.properties.find(params[:property_id])
    elsif params[:maintenance_record_id]
      @parent = MaintenanceRecord.find(params[:maintenance_record_id])
    elsif params[:education_record_id]
      @parent = EducationRecord.find(params[:education_record_id])
    elsif params[:employment_record_id]
      @parent = EmploymentRecord.find(params[:employment_record_id])
    elsif params[:user_id]
      @parent = User.find(params[:user_id])
    elsif params[:vehicle_id]
      @parent = Vehicle.find(params[:vehicle_id])
    elsif params[:account_id]
      @parent = @current_family.accounts.find(params[:account_id])
    end
  end

  def set_document
    @document = Document.find(params[:id])
  end

  # This is because they are shallow routes, like maintenance_record_path(record), instead of family_property_path(@current_family, property)
  def after_save_path
    if @parent.is_a?(User)
      user_path(@parent)
    elsif @parent.is_a?(MaintenanceRecord)
      maintenance_record_path(@parent)
    elsif @parent.is_a?(EducationRecord)
      education_record_path(@parent)
    elsif @parent.is_a?(EmploymentRecord)
      employment_record_path(@parent)
    elsif @parent.is_a?(Account)
      family_account_path(@current_family, @parent)
    else
      polymorphic_path([ @current_family, @parent ])
    end
  end

  # Same logic as before, this method tells the document form which model to send the data to
  def form_url
    if @document.persisted?
      document_path(@document)
    elsif @parent.is_a?(User)
      user_documents_path(@parent)
    elsif @parent.is_a?(MaintenanceRecord)
      maintenance_record_documents_path(@parent)
    elsif @parent.is_a?(EducationRecord)
      education_record_documents_path(@parent)
    elsif @parent.is_a?(EmploymentRecord)
      employment_record_documents_path(@parent)
    elsif @parent.is_a?(Account)
      family_account_documents_path(@current_family, @parent)
    else
      polymorphic_path([ @current_family, @parent, @document ])
    end
  end

  def document_params
    params.require(:document).permit(:title, :description, :document_type, :file)
  end
end
