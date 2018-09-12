require_relative 'boot'

require 'rails/all'
# Dir['./lib/idempotent_request/*.rb'].each { |f| require f }
require './lib/idempotent_request/idempotent_request.rb'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module VespertechBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
   # config.middleware.use IdempotentRequest
   config.middleware.use IdempotentRequest::Redis
    # Force uuid as the default primary key type
	config.generators do |g|
		g.orm :active_record, primary_key_type: :uuid
     # Because I'm using :uuid for PKs, let me specify them as the default for FKs too.
    g.orm :active_record, foreign_key_type: :uuid

	end
  end
end
