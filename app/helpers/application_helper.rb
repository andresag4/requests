module ApplicationHelper
  def current_translations
    @translator = I18n.backend
    @translator.load_translations
    @translations = @translator.send(:translations)[I18n.locale]
  end

  def has_policy(record, actions, devise_controller = nil)
    return true if current_user.god?
    record = record.classify.constantize if record.is_a? String
    actions.each { |query| return true if policy(record).send('general_policy', record, query, devise_controller) }
    false
  end

  def browser_valid?(browser)
    (browser.chrome? && browser.version < '45') || (browser.firefox? && browser.version < '40') ||
        (browser.ie? && browser.version < '9') || (browser.safari? && browser.version < '9') ||
        (browser.platform.windows? && browser.safari?)
  end

  def collection_scope(user, scope)
    policy_name = (scope.to_s + 'Policy').classify.constantize
    policy_name::ScopeActions.new(user, scope).collection_scope
  end

  def custom_paginator(resource, resource_class = '')
    will_paginate resource, class: "pagination pagination-sm #{resource_class}",
                  next_label: '<i class="fa fa-chevron-right"></i>'.html_safe,
                  previous_label: '<i class="fa fa-chevron-left"></i>'.html_safe
  end

  def asset_data_base64(path)
    asset = Rails.application.assets.find_asset(path)
    throw "Could not find asset '#{path}'" if asset.nil?
    base64 = Base64.encode64(asset.to_s).gsub(/\s+/, "")
    "data:#{asset.content_type};base64,#{Rack::Utils.escape(base64)}"
  end

  def get_birthdate(request)
    if request.general_information
      l request.general_information.birthdate, format: :custom
    else
      ''
    end
  end
end
