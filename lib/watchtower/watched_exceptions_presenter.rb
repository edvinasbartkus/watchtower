class WatchedExceptionsPresenter
  include Enumerable
  
  def initialize(params)
    scope = WatchedException
    scope = scope.search("%#{params[:query]}%") if params[:query]
    scope = scope.scoped_by_controller_action(params[:controller_action]) if params[:controller_action]
    scope = scope.scoped_by_exception_class(params[:exception_class])     if params[:exception_class]
    scope = scope.scoped({:conditions => \
      ["DATE(#{WatchedException.quoted_table_name}.created_at) >= ?", Date.parse(params[:start_at]).to_s(:db)]
    }) if params[:start_at]
    scope = scope.scoped({:conditions => \
      ["DATE(#{WatchedException.quoted_table_name}.created_at) <= ?", Date.parse(params[:end_at]).to_s(:db)]
    }) if params[:end_at]
    
    @watched_exceptions = scope.paginate(
      :per_page => 20, 
      :page => params[:page], 
      :select => 'id,controller_action,exception_class,message,`key`,created_at,looked'
    )
  end
  
  def each(&block)
    @watched_exceptions.each(&block)
  end
  
  def method_missing(call, *args)
    @watched_exceptions.send call, *args
  end
end
