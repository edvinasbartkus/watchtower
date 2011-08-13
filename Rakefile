require "rake"
require "rake/testtask"
require "rdoc/task"
require 'jeweler'
require './lib/watchtower/version.rb'

Jeweler::Tasks.new do |gem|
  gem.version = Watchtower::Version::VERSION

  gem.name = "watchtower"
  gem.summary = %Q{An exception logger for Rails 3.X}
  gem.description = %Q{An exception logger for Rails 3.X. Stores exceptions in database and provides interface to manage stored exceptions.}
  gem.email = "edvinas@geeks.lt"
  gem.homepage = "https://github.com/edvinasbartkus/watchtower"
  gem.authors = ["Edvinas Bartkus", "Martynas Margis"]
  
  gem.add_dependency "activesupport", ">= 2.3.0"
  gem.add_dependency "will_paginate", ">= 2.3.4"
  
  gem.files = Dir.glob('**/*.*').map{|f| f unless f =~ /\Atest/}.compact
end
Jeweler::RubygemsDotOrgTasks.new

namespace :test do
  Rake::TestTask.new(:all => ["generator:cleanup", 
                              "generator:generate"]) do |task|
    task.libs << "lib"
    task.libs << "test"
    task.pattern = "test/**/*_test.rb"
    task.verbose = false
  end
end

desc "Run the test suite"
task :default => "test:all"

generators = %w(watchtower watchtower_assets)

namespace :generator do
  desc "Cleans up the test app before running the generator"
  task :cleanup do
    generators.each do |generator|
      FileList["generators/#{generator}/templates/**/*.*"].each do |f|
        file = "test/rails_root/#{f.gsub("generators/#{generator}/templates/","")}"
        File.delete(file) if File.exists?(file)
      end
    end

    FileList["test/rails_root/db/**/*"].each do |each|
      FileUtils.rm_rf(each)
    end
    
    FileUtils.rm_rf("test/rails_root/vendor/plugins/watchtower")
    FileUtils.mkdir_p("test/rails_root/vendor/plugins")
    watchtower_root = File.expand_path(File.dirname(__FILE__))
    system("ln -s #{watchtower_root} test/rails_root/vendor/plugins/watchtower")
  end

  desc "Run the generator on the tests"
  task :generate do
    system "cd test/rails_root && ./script/generate watchtower && rake db:migrate db:test:prepare"
    system "cd test/rails_root && ./script/generate watchtower_assets"
  end
end

desc "Generate documentation for the watchtower plugin."
RDoc::Task.new do |rdoc|
  rdoc.rdoc_dir = "rdoc"
  rdoc.title    = "Watchtower"
  rdoc.options << "--line-numbers" << "--inline-source"
  rdoc.rdoc_files.include("README")
  rdoc.rdoc_files.include("lib/**/*.rb")
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each {|rakefile| load rakefile }