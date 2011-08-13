module Watchtower
  module WatchedExceptionBase
    def self.included(base)
      base.send :include, Callbacks
      base.send :include, Validations
      base.send :include, Scopes
      base.send :include, InstanceMethods
      base.extend ClassMethods
    end
    
    module Callbacks
      def self.included(base)
        base.send :include, InstanceMethods
        base.before_validation :generate_key, :if => lambda {|watched_exception| watched_exception.key.blank? }, :on => :create
        base.before_save :generate_controller_action, :clean_backtrace
      end
      
      module InstanceMethods
        def generate_key
          self.key = ActiveSupport::SecureRandom.hex(12)
        end
        
        def generate_controller_action
          self.controller_action = "#{self.controller_name}/#{self.action_name}"
        end
        
        def clean_backtrace; end
      end
    end
    
    module Validations
      def self.included(base)
        base.validates_presence_of :key
        base.validates_uniqueness_of :key
      end
    end
    
    module Scopes
      def self.included(base)
        base.class_eval do
          default_scope :order => "#{WatchedException.quoted_table_name}.created_at DESC"
          scope :recent, lambda {|*ct| ct = ct.first || 5; { :limit => ct }}
          scope :search, lambda {|query| {
            :conditions => [
              [ :controller_action, :exception_class, 
                :parameters, :message].map {|attribute| "#{WatchedException.quoted_table_name}.#{attribute} LIKE :query"}.join(" OR "), {:query => query}
              ]
          }}
          
        end
      end
    end
    
    module ClassMethods
      def create(env, exception)
        Rails.logger.silence do
          backtrace = ExceptionFormatter.format(exception)

          controller = env['action_controller.instance'] or return
          request = controller.request
          request_url = "#{" #{request.method.to_s.upcase}" unless request.get?} #{request.protocol}#{request.env["HTTP_HOST"]}#{request.fullpath}"

          request_env = env.to_hash.select {|key| key =~ /^[A-Z]/}
          request_env['REQUEST_FORMAT'] = request.format

          parameters  = request.parameters
          environment = request_env.keys.sort.inject [] do |env, key|
            env << "%s: %s" % [key, request_env[key].to_s.strip]
          end

          session = env['rack.session']

          create! \
            :controller_action => "#{controller.controller_name}/#{controller.action_name}",
            :exception_class   => exception.class.name,
            :message           => exception.message[0,255],
            :backtrace         => backtrace,
            :parameters        => parameters.pretty_inspect,
            :request           => request_url,
            :environment       => environment.join("\n"),
            :session           => session.pretty_inspect
        end
      end
      
      def exception_classes
        with_exclusive_scope do
          all(:select => "DISTINCT exception_class", :order => "exception_class").collect(&:exception_class)
        end
      end
      
      def controller_actions
        with_exclusive_scope do
          all(:select => "DISTINCT controller_action", :order => "controller_action").collect(&:controller_action)
        end
      end

      def stats
        data = connection.select_one("SELECT COUNT(id) count,MAX(created_at) last FROM #{table_name}").to_options
        data[:last] &&= data[:last].to_time
        data[:new] = count(:conditions => {:looked => 0})
        data
      end
    end
    
    module InstanceMethods
      def name
        "#{self.exception_class} in #{self.controller_action}".html_safe
      end
    end
    
  end
end
