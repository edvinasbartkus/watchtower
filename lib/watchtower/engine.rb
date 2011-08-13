module WatchtowerEngine
  class Engine < Rails::Engine
    config.autoload_paths << File.expand_path("../lib/watchtower", __FILE__)
  end
end