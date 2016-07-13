class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_user, only: [:show, :edit_user, :update_user, :destroy, :change_user_password,
                                  :save_user_password]
  before_action :set_current_user, only: [:edit, :update, :change_password, :save_password]
  skip_before_filter :authenticate_scope!, only: [:edit, :update, :destroy]
  skip_before_filter :require_no_authentication, only: [:new, :create, :cancel]
  skip_before_action :is_authorized, only: [:cancel, :edit, :update, :change_password, :save_password, :show]

  # GET /users
  # GET /users.json
  def index
    @users = policy_scope(User).paginate(page: params[:page], per_page: 15).order('id DESC')
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(sign_up_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_registrations_path, notice: t('notifications_masc.success.resource.created',
                                                                     resource: t('users.registrations.new.resource')) }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # PATCH/PUT /users/1
  def update
    prev_unconfirmed_email = @user.unconfirmed_email if @user.respond_to?(:unconfirmed_email)
    if @user.update_attributes(profile_update_params)
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ? :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      set_flash_message :notice, :updated
      sign_in @user, bypass: true
      redirect_to user_registration_path(@user)
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    respond_to do |format|
      if @user.destroy
        format.html { redirect_to user_registrations_path }
        format.json { head :no_content }
        flash[:notice] = t('notifications_masc.success.resource.destroyed',
                           resource: t('users.registrations.new.resource'))
      else
        format.html { render :index }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        flash_messages @user.errors.full_messages
      end
    end
  end

  # Method to modify our own password.
  def change_password
  end

  # Method to save our own password.
  def save_password
    respond_to do |format|
      if @user.update_with_password(profile_update_params) && @user.update(profile_update_params)
        # Sign in the user by passing validation in case their password changed
        sign_in @user, bypass: true
        format.html { redirect_to authenticated_root_path, notice: t('notifications_fem.success.resource.updated',
                                                                     resource: t('helpers.password')) }
        format.json { head :no_content }
      else
        format.html { render :change_password }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Method to edit a users as administrator.
  def edit_user
  end

  # Method to update a users as administrator.
  def update_user
    prev_unconfirmed_email = @user.unconfirmed_email if @user.respond_to?(:unconfirmed_email)
    if @user.update(account_update_params)
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ? :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      flash.now[:notice] = t('notifications_masc.success.resource.updated',
                             resource: t('users.registrations.new.resource'))
      redirect_to user_registrations_path
    else
      render 'edit_user'
    end
  end

  # Method to update the user password as administrator.
  def change_user_password
  end

  # Method to save the user password as administrator.
  def save_user_password
    flag = true if @user.eql? current_user
    user = @user

    respond_to do |format|
      if @user.update(account_update_params)
        # Sign in the user by passing validation in case their password changed
        sign_in user, bypass: true if flag
        format.html { redirect_to user_registrations_path,
                                  notice: t('notifications_fem.success.resource.updated',
                                            resource: t('helpers.password')) }
        format.json { head :no_content }
      else
        format.html { render :change_user_password }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_current_user
    @user = current_user
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :mother_last_name,
                                 :role_id, :area_id)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :mother_last_name,
                                 :role_id, :area_id)
  end

  def profile_update_params
    params.require(:user).permit(:email, :current_password, :password, :password_confirmation, :first_name, :last_name,
                                 :mother_last_name)
  end

  def needs_password?
    @user.email != params[:user][:email] || params[:user][:password].present?
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
