module Fastlane
  module Actions
    class GithubStatusAction < Action
      def self.run(params)
        UI.message "The github_status plugin is working!"

        ui = Plugin::GitHubStatus::UI.new
        client = Plugin::GitHubStatus::Client.new
        status_message = Plugin::GitHubStatus::Message.new(client.last_message)

        ui.print_message(status_message)
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
    end
  end
end
