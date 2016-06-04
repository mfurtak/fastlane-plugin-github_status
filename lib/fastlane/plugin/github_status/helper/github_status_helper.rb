module Fastlane
  module Helper
    class GithubStatusHelper
      # class methods that you define here become available in your action
      # as `Helper::GithubStatusHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the github_status plugin helper!")
      end
    end
  end
end
