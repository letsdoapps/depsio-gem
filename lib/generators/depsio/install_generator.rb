class Depsio::InstallGenerator < ::Rails::Generators::Base
  desc "Creates the Depsio initializer file at config/initializers/depsio.rb"

  source_root File.expand_path("../templates", __FILE__)

  class_option :api_key, :aliases => "-k", :type => :string,
    :desc => "Your Deps.io API key"

  def install
    ensure_api_key_exists
    generate_initializer unless api_key_configured?
  end

  private

  def ensure_api_key_exists
    if !options[:api_key] && !api_key_configured?
      puts "Must pass --api-key or create config/initializers/depsio.rb"
      exit
    end
  end

  def api_key_expression
    "#{options[:api_key]}"
  end

  def generate_initializer
    template 'initializer.rb', 'config/initializers/depsio.rb'
  end

  def api_key_configured?
    File.exists?('config/initializers/depsio.rb')
  end
end
