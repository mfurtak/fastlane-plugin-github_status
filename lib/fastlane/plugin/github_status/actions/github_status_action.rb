module Fastlane
  module Actions
    class GithubStatusAction < Action
      def self.run(params)
        message = client.last_message
        ui.print_message(message)

        if message.status_at_least?(params[:abort_level])
          ui.abort!("Aborting because of GitHub status: #{ui.status_statement(message)}")
        end

        message
      end

      def self.description
        'Provides the ability to check on GitHub server status as part of your build'
      end

      def self.authors
        ['Michael Furtak']
      end

      def self.available_options
        Plugin::GitHubStatus::Options.available_options
      end

      def self.is_supported?(platform)
        true
      end

      #
      # collaborators
      #

      class << self
        attr_accessor :ui
        attr_accessor :client
      end

      def self.ui
        @ui ||= Plugin::GitHubStatus::UI.new
      end

      def self.client
        @client ||= Plugin::GitHubStatus::Client.new
      end
    end
  end
end
