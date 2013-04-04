module Depsio
  # Used to set up and modify settings for the notifier.
  class Configuration
    attr_accessor :api_key, :endpoint, :enabled_environments, :logger

    def initialize
      @enabled_environments = %w(production)
    end

    def endpoint
      @endpoint ||= "https://deps.io/api/v1/apps/#{@api_key}/update.json"
    end

    def enabled?
      enabled_environments.include?(::Rails.env)
    end
  end
end