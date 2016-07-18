class PermissionsController < ApplicationController
  before_action :set_permission, only: [:show, :edit, :update, :destroy]

  # GET /permissions
  # GET /permissions.json
  def index
    @permissions = Permission.all.paginate(page: params[:page], per_page: 15).order('id DESC')
  end

  # GET /permissions/1
  # GET /permissions/1.json
  def show
  end

  # GET /permissions/new
  def new
    @permission = Permission.new
    @actions = []
    @controllers = get_controllers
  end

  # GET /permissions/1/edit
  def edit
    @controllers = get_controllers
    controller = @permission.controller.split('Controller').first.to_s
    @actions = controller_actions(controller)
  end

  # POST /permissions
  # POST /permissions.json
  def create
    @permission = Permission.new(permission_params)
    respond_to do |format|
      if @permission.save
        format.html { redirect_to permissions_url, notice: t('notifications_masc.success.resource.created',
                                                             resource: t('permissions.form.resource')) }
        format.json { render :show, status: :created, location: @permission }
      else
        # The values are obtained again in case of errors since the values are lost on the request.
        @controllers = get_controllers
        controller = params[:permission][:controller].split('Controller').first.to_s
        @actions = controller_actions(controller)

        format.html { render :new }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permissions/1
  # PATCH/PUT /permissions/1.json
  def update
    respond_to do |format|
      if @permission.update(permission_params)
        format.html { redirect_to permissions_url, notice: t('notifications_masc.success.resource.updated',
                                                             resource: t('permissions.form.resource')) }
        format.json { render :show, status: :ok, location: @permission }
      else
        # The values are obtained again in case of errors since the values are lost on the request.
        @controllers = get_controllers
        controller = params[:permission][:controller].split('Controller').first.to_s
        @actions = controller_actions(controller)

        format.html { render :edit }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permissions/1
  # DELETE /permissions/1.json
  def destroy
    @permission.destroy
    respond_to do |format|
      format.html { redirect_to permissions_url }
      format.json { head :no_content }
      flash['notice'] = t('notifications_masc.success.resource.destroyed', resource: t('permissions.form.resource'))
    end
  end

  # Returns all the possible actions from given controller (resource) by request.
  def get_controller_actions
    controller = params[:resource].split('Controller').first.to_s
    @actions = controller_actions(controller)
    respond_to do |format|
      format.js
    end
  end

  # Generate the seeds of the permissions.
  def generate_seeds
    respond_to do |format|
      if system('rake db:seed:dump MODELS=Permission FILE=db/seeds/permissions.seeds.rb') &&
          system('rake db:seed:dump MODELS=PermissionRole FILE=db/seeds/roles_permissions.seeds.rb')
        format.json { render :index, status: :ok }
      else
        format.html { render :index }
        format.json { render status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_permission
    @permission = Permission.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def permission_params
    params.require(:permission).permit(:name, :description, :action, :controller, role_ids: [])
  end

  # Get a list of all application controllers.
  def get_controllers
    generic_controllers = Dir[Rails.root.join('app/controllers/*_controller.rb')]
                              .map { |path| (path.match(/(\w+)_controller.rb/); $1.capitalize).camelize }

    devise_controllers = Dir[Rails.root.join('app/controllers/users/*_controller.rb')]
                             .map { |path| 'Users::' + (path.match(/(\w+)_controller.rb/); $1.capitalize).camelize }
    controllers = generic_controllers + devise_controllers
    controller_exceptions = Rails.configuration.x.controller_exceptions
    controller_exceptions.each do |a1|
      controllers.each { |a2| controllers.delete_at(controllers.find_index(a2)) if a2.include? a1 }
    end
    controllers + ['Application']
  end

  # Returns all the possible actions from given controller (resource).
  def controller_actions(controller)
    return [] if controller.nil? or controller.blank?
    begin
      (controller + 'Controller').constantize.instance_methods(false).sort.map { |actions| actions.to_s }
    rescue
      return []
    end
  end
end
