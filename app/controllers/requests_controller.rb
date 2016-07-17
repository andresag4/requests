class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy, :generate_request_pdf]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all.paginate(page: params[:page], per_page: 15)
  end

  def index_projects
    @requests = Request.project.paginate(page: params[:page], per_page: 15)

    render 'index'
  end

  def index_complaints
    @requests = Request.complaint.paginate(page: params[:page], per_page: 15)

    render 'index'
  end

  def index_audiences
    @requests = Request.audience.paginate(page: params[:page], per_page: 15)

    render 'index'
  end

  def index_resumes
    @requests = Request.resume.paginate(page: params[:page], per_page: 15)

    render 'index'
  end

  def index_managements
    @requests = Request.management.paginate(page: params[:page], per_page: 15)

    render 'index'
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  # def new
  #   @request = Request.new
  # end

  def new_project
    @request = Request.new(data_type: :project)
    @request.build_contact
    @request.build_project
    @request.build_general_information

    render 'new'
  end

  def new_complaint
    @request = Request.new(data_type: :complaint)
    @request.build_contact
    @request.build_complaint
    @request.build_general_information

    render 'new'
  end

  def new_audience
    @request = Request.new(data_type: :audience)
    @request.build_contact
    @request.build_audience
    @request.build_general_information

    render 'new'
  end

  def new_resume
    @request = Request.new(data_type: :resume)
    @request.build_contact
    @request.build_resume
    @request.build_general_information

    render 'new'
  end

  def new_management
    @request = Request.new(data_type: :management)
    @request.build_contact
    @request.build_management
    @request.build_general_information

    render 'new'
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    @request.assign_json_attributes(params) if @request.resume?

    respond_to do |format|
      if @request.save
        @request.set_folio
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    @request.assign_json_attributes(params) if @request.resume?
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def generate_request_pdf
    pdf_name = current_user.email + '_' + Time.now.strftime('%Y%d%m_%H%M%S') + '.pdf'
    html = render_to_string(action: :generate_pdf, layout: false)
    pdf = WickedPdf.new.pdf_from_string(html)

    send_data(pdf,
              filename: pdf_name,
              disposition: 'attachment')
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def request_params
    params.require(:request).permit(:reception_date, :data_type, :user_id, :entry_id, :area_id, :responsible_id,
                                    project_attributes: [:id, :category_id, :name, :description],
                                    general_information_attributes: [:id, :request_id, :title_id, :name, :father_last_name,
                                                                     :mother_last_name, :birthdate, :gender_id, :email,
                                                                     :position, :organization, :ip, :anonymous,
                                                                     contact_phones_attributes: [:id, :tag, :number, :_destroy]],
                                    contact_attributes: [:id, :request_id, :state_id, :city_id, :colony_id, :postcode,
                                                         :street, :internal_number, :external_number],
                                    complaint_attributes: [:id, :category_id, :subject, :notes],
                                    audience_attributes: [:id, :category_id, :subject, :description],
                                    management_attributes: [:id, :category_id, :subject, :description],
                                    resume_attributes: [:id, :category_id,
                                                        studies_attributes: [:id, :institution, :degree, :end_study, :_destroy],
                                                        abilities_attributes: [:id, :name, :_destroy],
                                                        languages_attributes: [:id, :name, :percentage, :_destroy]],

                                    request_files_attributes: [:id, :file, :_destroy])
  end
end
