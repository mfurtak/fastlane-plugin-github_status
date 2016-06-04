module Fastlane
  module Actions
    class GithubStatusAction < Action
      def self.run(params)
        ui.print_message(client.last_message)
      end

      def self.description
        'Provides the ability to check on GitHub server status as part of your build'
      end

      def self.authors
        ['Michael Furtak']
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "GITHUB_STATUS_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        true
      end

      #
      # collaborators
      #

      # Used to override the UI for testing
      def self.ui=(ui)
        @ui = ui
      end

      def self.ui
        @ui ||= Plugin::GitHubStatus::UI.new
      end

      # Used to override the Client for testing
      def self.client=(client)
        @client = client
      end

      def self.client
        @client ||= Plugin::GitHubStatus::Client.new
      end
    end
  end
end
