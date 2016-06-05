# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/github_status/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-github_status'
  spec.version       = Fastlane::GithubStatus::VERSION
  spec.author        = 'Michael Furtak'
  spec.email         = 'michael.furtak@gmail.com'

  spec.summary       = 'Provides the ability to display and act upon GitHub server status as part of your build'
  spec.homepage      = 'https://github.com/mfurtak/fastlane-plugin-github_status'
  spec.license       = 'MIT'

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'colored'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 1.93.1'
end
