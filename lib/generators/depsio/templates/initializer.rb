# -*- encoding : utf-8 -*-
Depsio.configure do |config|
  config.api_key = "<%= api_key_expression %>"
  config.enabled_environments = [ "development" ]
end
