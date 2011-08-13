h1. Watchtower

h2. Setup

Install the plugin:

    script/plugin install git://github.com/joshuaclayton/watchtower.git

Move the assets (requires rsync):

    cd vendor && rake watchtower:sync

Set up ApplicationController

    class ApplicationController < ActionController::Base
      include Watchtower::ApplicationControllerBase
      force_public_request_handling! # use this to force local development to rescue actions like a production server
      # etc...
    end

If you want to secure the data, you might want to set up an initializer:

    WatchtowerController.class_eval do
      before_filter :check_credentials
      
      private
      
      def check_credentials
        # call login_required (from your auth system or whatever) unless viewing a specific exception by key
        login_required unless find_by_key?
      end
    end
    
Copyright (c) 2009 Josh Clayton, released under the MIT license