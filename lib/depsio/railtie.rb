require 'depsio'
require 'rails'

module Depsio
  class Railtie < ::Rails::Railtie
    if not ENV['RACK_ENV'].blank?
      config.after_initialize do
        Depsio.configure do |config|
          if ::Rails.env == "development"
            config.logger = Logger.new(STDOUT)
          else
            config.logger = ::Rails.logger
          end
        end
        Depsio.update_dependencies
      end
    end
  end
end