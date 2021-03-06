# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Watchtower::ApplicationControllerBase
  force_public_request_handling!
  
  helper :all
  protect_from_forgery
end
