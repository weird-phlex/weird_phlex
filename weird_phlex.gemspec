# frozen_string_literal: true

require_relative "lib/weird_phlex/version"

Gem::Specification.new do |s|
  s.name = "weird_phlex"
  s.version = WeirdPhlex::VERSION
  s.authors = ["Klaus Weidinger"]
  s.email = ["Klaus Weidinger"]
  s.homepage = "https://github.com/weird-phlex/weird_phlex"
  s.summary = "Example description"
  s.description = "Example description"

  s.metadata = {
    "bug_tracker_uri" => "https://github.com/weird-phlex/weird_phlex/issues",
    "changelog_uri" => "https://github.com/weird-phlex/weird_phlex/blob/master/CHANGELOG.md",
    "documentation_uri" => "https://github.com/weird-phlex/weird_phlex",
    "homepage_uri" => "https://github.com/weird-phlex/weird_phlex",
    "source_code_uri" => "https://github.com/weird-phlex/weird_phlex"
  }

  s.license = "MIT"

  s.files = Dir.glob("lib/**/*") + Dir.glob("bin/**/*") + %w[README.md LICENSE.txt CHANGELOG.md]
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 2.7"

  s.bindir = "bin"
  s.executables = ["weird_phlex", "wph"]

  s.add_development_dependency "bundler", ">= 1.15"
  s.add_development_dependency "combustion", ">= 1.1"
  s.add_development_dependency "rake", ">= 13.0"
  s.add_development_dependency "rspec", ">= 3.9"
  s.add_dependency "thor", ">= 1.3.1"
end
