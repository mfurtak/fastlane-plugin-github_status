$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

# This module is only used to check the environment is currently a testing env
module SpecHelper
end

require 'fastlane' # to import the Action super class
require 'fastlane/plugin/github_status' # import the actual plugin

Fastlane.load_actions # load other actions (in case your plugin calls other actions or shared values)

def message_from_response_fixture
  json = JSON.parse(File.read('spec/fixtures/response.json'))
  Fastlane::Plugin::GitHubStatus::Message.new(json)
end
