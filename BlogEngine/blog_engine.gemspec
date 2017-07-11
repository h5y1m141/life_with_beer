$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blog_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blog_engine"
  s.version     = BlogEngine::VERSION
  s.authors     = ["LifeIsBeer"]
  s.email       = ["info@lifeisbeer.com"]
  s.homepage    = "http://lifeisbeer.com"
  s.summary     = "Life is beer: Summary of BlogEngine."
  s.description = "Life is beer: Description of BlogEngine."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "sqlite3"
end
