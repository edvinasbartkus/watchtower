module Watchtower
  class Engine < Rails::Engine
    config.autoload_paths << File.expand_path("../", __FILE__)
    
    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

    initializer 'watchtower.log_exceptions', :after => :finisher_hook do |app|
      require File.expand_path('../show_exceptions', __FILE__)
    end
  end
end