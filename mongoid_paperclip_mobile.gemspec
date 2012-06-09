$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mongoid/paperclip/mobile/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mongoid_paperclip_mobile"
  s.version     = Mongoid::Paperclip::Mobile::VERSION
  s.authors     = ["Michael North"]
  s.email       = ["michael.north@truenorthapps.com"]
  s.homepage    = "http://github.com/TrueNorth/mongoid_paperclip_mobile"
  s.summary     = "Easy use of mongoid and paperclip for mobile web apps"
  s.description = "Easy use of mongoid and paperclip for mobile web apps"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.markdown"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.1"
  s.add_dependency "mongoid", "~> 2.4.5"
  s.add_dependency "mongoid-paperclip", "~> 0.0.7"

end
