# --- Advanced cleaner+ for Watchtower ---
module ExceptionFormatter
  class << self
    
    TEMPLATE_REGEXP = %r{:in `_\w*'} # '
    GEMS_PATHS = (Gem.path + [Gem.default_dir]).uniq.map!{ |p| Regexp.escape(p) }
    GEM_REGEXP = %r{(#{GEMS_PATHS.join('|')})/gems/([^/]+)-([\w\.]+)/(.*)}
    
    RAILS_GEM = %r{^(?:railties|activesupport|actionpack|actionmailer|activemodel|activerecord)\b}
    IMPORTANT = %r{^(?:app|config|lib|vendor)/}
    TERMINAL = %r{^(?:rack|passenger|thin|mongrel)}
    
    def filter(line)
      line = line.dup
      line.sub!("#{Rails.root}/", '')
      line.sub!(TEMPLATE_REGEXP, '')
      line.sub!(GEM_REGEXP, '\2 (\3) \4')
      line
    end
    
    def format(exception)
      # Rails.backtrace_cleaner.clean(exception.backtrace)
      items = [exception.message, '']
      
      state = :normal
      cnt_r = 0
      exception.backtrace.each.with_index do |line,idx|
        line = filter(line)
        
        # state machine, LOL :)
        if state == :final
          next unless line =~ IMPORTANT
        elsif line =~ TERMINAL # :final
          items << "<rails stack: #{cnt_r} lines>" if state == :rails and cnt_r > 0
          state = :final
        elsif line =~ RAILS_GEM # :rails
          if state != :rails
            cnt_r = 0
            state = :rails
          else
            cnt_r += 1
            next
          end
        else # :normal
          if state != :normal
            items << "<rails stack: #{cnt_r} lines>" if state == :rails and cnt_r > 0
            state = :normal
          end
        end
        
        items << line
      end
      
      items.join("\n")
    end
  end
end