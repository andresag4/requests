require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Gobierno
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Chihuahua'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # To use default rails generators. Active Admin changes this behavior.
    config.app_generators.scaffold_controller = :scaffold_controller

    # Add custom validators path.
    config.autoload_paths += %W[#{config.root}/app/validators/ #{config.root}/lib]

    # Contains the controllers that will be excluded from the permissions.
    config.x.controller_exceptions = %w(Home PasswordExpired Confirmation Password OmniauthCallback Session Application)

    # Contains controllers that must be treated different by the General Policy.
    config.x.special_controllers = %w(home application)
  end
end
