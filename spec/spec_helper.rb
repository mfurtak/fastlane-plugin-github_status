$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

# This module is only used to check the environment is currently a testing env
module SpecHelper
end

require 'fastlane' # to import the Action super class
require 'fastlane/plugin/github_status' # import the actual plugin

Fastlane.load_actions # load other actions (in case your plugin calls other actions or shared values)

def message_from_response_fixture
  Fastlane::Plugin::GitHubStatus::Message.new(message_fixture_data)
end

def message_fixture_data
  JSON.parse(File.read('spec/fixtures/response.json'))
end

def message_from_params(params = {})
  data = message_fixture_data.merge!(params)
  Fastlane::Plugin::GitHubStatus::Message.new(data)
end
