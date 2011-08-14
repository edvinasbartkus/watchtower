# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{watchtower}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Edvinas Bartkus}, %q{Martynas Margis}]
  s.date = %q{2011-08-13}
  s.description = %q{An exception logger for Rails 3.X. Stores exceptions in database and provides interface to manage stored exceptions.}
  s.email = %q{edvinas@geeks.lt}
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "README.md",
    "app/controllers/watchtower_controller.rb",
    "app/helpers/watchtower_helper.rb",
    "app/models/watched_exception.rb",
    "app/views/layouts/watchtower.erb",
    "app/views/watchtower/_recordset.erb",
    "app/views/watchtower/destroy.js.rjs",
    "app/views/watchtower/destroy_multiple.js.rjs",
    "app/views/watchtower/index.html.erb",
    "app/views/watchtower/index.js.rjs",
    "app/views/watchtower/show.html.erb",
    "config/routes.rb",
    "lib/generators/watchtower/install/install_generator.rb",
    "lib/generators/watchtower/install/templates/create_watched_exceptions.rb",
    "lib/generators/watchtower/install/templates/public/javascripts/watchtower/jquery-1.3.2.min.js",
    "lib/generators/watchtower/install/templates/public/javascripts/watchtower/jquery-ui-1.7.1.custom.min.js",
    "lib/generators/watchtower/install/templates/public/javascripts/watchtower/jquery.watchtower.bindings.js",
    "lib/generators/watchtower/install/templates/public/javascripts/watchtower/jquery.watchtower.events.js",
    "lib/generators/watchtower/install/templates/public/javascripts/watchtower/jquery.watchtower.js",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/admin.css",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/assets/images/ajax-loader.gif",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/assets/images/bullet-black.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/assets/images/buttons/sprite-gray.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/assets/images/buttons/x.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/assets/images/icons/caution-sign-red.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/assets/images/icons/caution-sign-sm.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/assets/images/icons/caution-sign.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/assets/images/icons/edit-template.gif",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/assets/images/icons/success-badge.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/assets/images/nav-admin-shadow.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/extras.css",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/forms.css",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/ie.css",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/images/ui-bg_flat_0_aaaaaa_40x100.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/images/ui-bg_glass_55_fbf9ee_1x400.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/images/ui-bg_glass_65_ffffff_1x400.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/images/ui-bg_glass_75_dadada_1x400.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/images/ui-bg_glass_75_e6e6e6_1x400.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/images/ui-bg_glass_75_ffffff_1x400.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/images/ui-bg_highlight-soft_75_cccccc_1x100.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/images/ui-bg_inset-soft_95_fef1ec_1x100.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/images/ui-icons_222222_256x240.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/images/ui-icons_2e83ff_256x240.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/images/ui-icons_454545_256x240.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/images/ui-icons_888888_256x240.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/images/ui-icons_cd0a0a_256x240.png",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/jquery-ui-1.7.1.custom.css",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/reset.css",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/screen.css",
    "lib/generators/watchtower/install/templates/public/stylesheets/watchtower/watchtower.css",
    "lib/watchtower.rb",
    "lib/watchtower/controller_base.rb",
    "lib/watchtower/engine.rb",
    "lib/watchtower/exception_formatter.rb",
    "lib/watchtower/show_exceptions.rb",
    "lib/watchtower/version.rb",
    "lib/watchtower/watched_exceptions_presenter.rb",
    "rails/init.rb",
    "tasks/watchtower_tasks.rake"
  ]
  s.homepage = %q{https://github.com/edvinasbartkus/watchtower}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.8}
  s.summary = %q{An exception logger for Rails 3.X}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.0"])
      s.add_runtime_dependency(%q<will_paginate>, [">= 2.3.4"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.3.0"])
      s.add_dependency(%q<will_paginate>, [">= 2.3.4"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.3.0"])
    s.add_dependency(%q<will_paginate>, [">= 2.3.4"])
  end
end

