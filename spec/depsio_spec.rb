require 'spec_helper'

describe Depsio do
  describe Depsio::Configuration do
    it "should use production as default enabled environments" do
      Depsio.config.enabled_environments.should  match_array(%w(production))
    end

    it "should add api_key to endpoint" do
      Depsio.configure {|config| config.api_key = "test_key" }
      Depsio.config.endpoint.should eq("https://deps.io/api/v1/apps/test_key/update.json")
    end
  end
end