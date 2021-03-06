require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Flynn
  class Application < Rails::Application
    config.generators do |generate|
          generate.assets false
          generate.helper false
          generate.test_framework  :test_unit, fixture: false
        end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        # resource '*', headers: :any, methods: [:post]
        # resource '*', headers: :any, methods: [:get, :post, :delete, :put, :patch, :options, :head]
        resource '/api/v1/audios', headers: :any, methods: [:post]
        resource '/api/v1/audios_playlists', headers: :any, methods: [:post]
      end
    end
     # config.autoload_paths += %W( services )
    config.time_zone = "Paris"
    config.active_record.default_timezone = :local

    #for Ajax
    # config.action_view.embed_authenticity_token_in_remote_forms = true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
