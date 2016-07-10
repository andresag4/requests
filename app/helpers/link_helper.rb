module LinkHelper
  def link_item(text, url, css_class = nil)
    link_to(text, url, css_class) if link_item_visible?(url)
  end

  def link_disable_policy(name, url, html_options = {})
    link_to_if(link_item_visible?(url), name, url, html_options)
  end

  private

  def link_item_visible?(url)
    return true if current_user.god?
    parsed_params = Rails.application.routes.recognize_path(url)
    begin
      record = parsed_params[:controller].classify.constantize
    rescue
      record = parsed_params[:controller].singularize.to_sym
    end
    query = "#{parsed_params[:action]}"
    policy(record).send('general_policy', record, query)
  end
end
