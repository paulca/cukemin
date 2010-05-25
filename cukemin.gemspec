# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cukemin}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Paul Campbell"]
  s.date = %q{2010-05-25}
  s.email = %q{paul@rslw.com}
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "CHANGELOG",
     "README.md",
     "Rakefile",
     "cukemin.gemspec",
     "generators/cukemin/USAGE",
     "generators/cukemin/cukemin_generator.rb",
     "generators/cukemin/templates/controller.rb",
     "generators/cukemin/templates/feature.feature",
     "generators/cukemin/templates/views/_form.html.erb",
     "generators/cukemin/templates/views/edit.html.erb",
     "generators/cukemin/templates/views/index.html.erb",
     "generators/cukemin/templates/views/new.html.erb",
     "rails/init.rb",
     "spec/blueprints.rb",
     "spec/cukemin_generator_spec.rb",
     "spec/database.yml",
     "spec/debug.log",
     "spec/schema.rb",
     "spec/spec_helper.rb"
  ]
  s.has_rdoc = false
  s.homepage = %q{http://www.github.com/paulca/cukemin}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Simple admin controllers and views, with cucumber features}
  s.test_files = [
    "spec/blueprints.rb",
     "spec/cukemin_generator_spec.rb",
     "spec/schema.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

