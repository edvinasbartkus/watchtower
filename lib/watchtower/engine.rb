module Watchtower
  class Engine < Rails::Engine
    config.autoload_paths << File.expand_path("../", __FILE__)
  end
end