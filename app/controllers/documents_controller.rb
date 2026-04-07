class DocumentsController < ApplicationController
  before_action :set_parent, only: [ :index, :new, :create ]
  before_action :set_document, only: [ :show, :destroy ]
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
    redirect_back fallback_location: document_path(@document), notice: "Document successfullyt deleted."
  end

  private

  def set_parent
    # to-do - add vehicles and users here when i create them
    if params[:property_id]
      @parent = @current_family.properties.find(params[:property_id])
    elsif params[:maintenance_record_id]
      @parent = MaintenanceRecord.find(params[:maintenance_record_id])
    elsif params[:education_record_id]
      @parent = EducationRecord.find(params[:education_record_id])
    elsif params[:user_id]
      @parent = User.find(params[:user_id])
    end
  end

  def set_document
    @document = Document.find(params[:id])
  end

  def after_save_path
    if @parent.is_a?(User)
      user_path(@parent)
    elsif @parent.is_a?(MaintenanceRecord)
      maintenance_record_path(@parent)
    elsif @parent.is_a?(EducationRecord)
      education_record_path(@parent)
    else
      polymorphic_path([ @current_family, @parent ])
    end
  end

  def form_url
    if @document.persisted?
      document_path(@document)
    elsif @parent.is_a?(User)
      user_documents_path(@parent)
    elsif @parent.is_a?(MaintenanceRecord)
      maintenance_record_documents_path(@parent)
    else
      polymorphic_path([ @current_family, @parent, @document ])
    end
  end

  def document_params
    params.require(:document).permit(:title, :description, :document_type, :file)
  end
end
