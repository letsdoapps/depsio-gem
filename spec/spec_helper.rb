require 'rubygems'
require 'bundler/setup'

require 'depsio'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end