module Fastlane
  module Plugin
    module GitHubStatus
      # Calls GitHub's status API and returns model objects to represent the data
      class Client
        API_ENDPOINT = 'https://status.github.com/api'.freeze

        # @return Message representing the last status update from GitHub
        def last_message
          message_json = JSON.parse(open("#{API_ENDPOINT}/last-message.json").read)
          Plugin::GitHubStatus::Message.new(message_json)
        end
      end
    end
  end
end
