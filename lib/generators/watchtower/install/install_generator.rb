require 'rails/generators/migration'

module Watchtower
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc "creates watchtower migrations"

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def copy_migrations
        migration_template "create_watched_exceptions.rb", "db/migrate/create_watched_exceptions.rb"
      end
      
      def manifest
        root = File.join(File.dirname(__FILE__), "templates/public")
        Dir.glob(File.join(root, "**", "*.*")).each do |f|
          file = "public/"+f.gsub("#{root}/", "")
          copy_file file, file  
        end
      end
    end
  end
end
