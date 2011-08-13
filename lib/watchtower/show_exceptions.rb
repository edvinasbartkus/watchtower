module Watchtower
  class ActionDispatch::ShowExceptions

  private
    def render_exception_with_watchtower(env, exception)
      unless ActionController::RoutingError === exception
        WatchedException.create(env, exception)
      end
      
      render_exception_without_watchtower(env, exception)
    end
    
    alias_method_chain :render_exception, :watchtower
  end
end