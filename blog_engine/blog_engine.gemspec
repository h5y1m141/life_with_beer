$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blog_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blog_engine"
  s.version     = BlogEngine::VERSION
  s.authors     = ["lifeisbeer"]
  s.email       = ["info@lifeisbeer.com"]
  s.homepage    = "http://lifeisbeer.com"
  s.summary     = "lifeisbeer: Summary of BlogEngine."
  s.description = "lifeisbeer: Description of BlogEngine."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "spec/factories/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.11"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
end
