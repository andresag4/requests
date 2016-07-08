class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_user!, :is_authorized

  # Verifies the user permissions before performing an action.
  def is_authorized
    controller = params[:controller].classify
    exception = controller.split(':').first
    if exception.include? 'User'
      exception = controller.split(':').last
      devise_controller = controller.split(':').first
    end

    unless Rails.configuration.x.controller_exceptions.include? exception
      return true if current_user.god?
      if devise_controller
        authorize_with devise_controller.classify.constantize, params[:action].to_s, controller
      else
        begin
          authorize_with controller.classify.constantize
        rescue
          authorize_with controller.singularize.to_sym
        end
      end
    end
  end

  # Checks whether a user can make a specific action on the system.
  def authorize_with(record, query = nil, devise_controller = nil)
    query ||= params[:action].to_s
    @_pundit_policy_authorized = true
    policy = policy(record)
    unless policy.public_send('general_policy', record, query, devise_controller)
      raise NotAuthorizedError.new(query: query, record: record, policy: policy)
    end
    true
  end

  # If the user doesn't have permission to perform an action is redirected.
  def user_not_authorized
    flash[:alert] = I18n.t('pundit.default')
    redirect_to(request.referrer || authenticated_root_path || unauthenticated_root_path)
  end

  # Display flash messages for custom validations.
  def flash_messages(errors)
    errors.each { |message| flash['alert_'+ message.gsub(/\s+/, '_')] = message }
  end
end
