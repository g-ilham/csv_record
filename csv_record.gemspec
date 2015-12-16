$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "csv_record/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "csv_record"
  s.version     = CsvRecord::VERSION
  s.authors     = ["Ilgam Gaysin"]
  s.email       = ["ilgamgaysin@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of CsvRecord."
  s.description = "TODO: Description of CsvRecord."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
end
