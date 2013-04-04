require "depsio/version"
require "depsio/configuration"

require 'depsio/railtie' if defined?(Rails::Railtie)

require 'rest_client'

module Depsio

  class << self
    def configure
      yield(config)
    end

    def config
      @configuration ||= Configuration.new
    end

    def logger
      @configuration.logger
    end

    def update_dependencies
      filepath = "Gemfile.lock"
      if config.enabled? && File.exists?(filepath)
        dependencies = IO.read(filepath) 
        logger.info "Deps.io: Update dependencies"
        begin
          RestClient.post config.endpoint, { :dependencies => dependencies, :type => :gemfile }
        rescue Exception => e
          logger.error e 
        end
      end
    end

  end
end
