class WatchtowerController < ApplicationController
  before_filter :find_exception, :only => [:show, :destroy]
  include ActionView::Helpers::TextHelper

  def index
    @watched_exceptions = WatchedExceptionsPresenter.new(params)
    respond_to do |format|
      format.html
      format.js {  render :layout => false }
      format.rss { render :layout => false }
    end
  end
  
  def show; end
  
  def destroy
    @watched_exception.destroy
    render :nothing => true
  end
  
  def destroy_multiple
    @deleted_exceptions = WatchedException.find_all_by_id(params[:id].split(",").map(&:strip))
    @deleted_exceptions.each do |watched_exception|
      watched_exception.destroy
    end
    
    render :js => "window.location.reload();"
  end
  
  protected
  
  def find_by_key?
    @show_by_key || false
  end
  
  def find_by_id?
    @show_by_id || false
  end
  
  private
  
  def find_exception
    key = params[:id]
    @watched_exception = WatchedException.find_by_key(key)
    if @watched_exception
      @show_by_key = true
      return
    end
    @watched_exception = WatchedException.find_by_id(key)
    @show_by_id = true if @watched_exception
    raise ActiveRecord::RecordNotFound unless @watched_exception
  end
end