$:.push File.expand_path("../lib", __FILE__)

require "rails-bootstrap-helpers/version"

Gem::Specification.new do |s|
  s.name        = "rails-bootstrap-helpers"
  s.version     = RailsBootstrapHelpers::VERSION
  s.authors     = ["Jacob Carlborg"]
  s.email       = ["jacob.carlborg@tretti.se"]
  s.homepage    = "https://github.com/Tretti/rails-bootstrap-helpers"
  s.summary     = "A Rails plugin that contains helpers for Bootstrap"
  s.description = "A Rails plugin that contains helpers for Bootstrap"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]
  s.require_paths = ["lib"]

  s.add_dependency 'rails', '5.0.0.1'

  s.add_development_dependency "pry-doc"
  s.add_development_dependency "pry-exception_explorer"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "pry-stack_explorer"
  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
end
