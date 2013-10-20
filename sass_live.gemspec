$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sass_live/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sass_live"
  s.version     = SassLive::VERSION
  s.authors     = ["Matt Smith"]
  s.email       = ["matt@thinkific.com"]
  s.homepage    = "https://github.com/mattsmith/sass_live"
  s.summary     = "Live/Dynamic Compilation of Sass for Ruby on Rails."
  s.description = "Ideal for when user's of your system can provide css 
                  customization values."
  s.license     = "MIT"
                  
  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  
  s.test_files = Dir["spec/**/*"]
end