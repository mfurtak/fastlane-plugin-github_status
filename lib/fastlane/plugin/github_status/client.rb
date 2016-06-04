module Fastlane
  module Plugin
    module GitHubStatus
      class Client
        API_ENDPOINT = 'https://status.github.com/api'.freeze

        def last_message
          message_json = JSON.parse(open("#{API_ENDPOINT}/last-message.json").read)
          Plugin::GitHubStatus::Message.new(message_json)
        end
      end
    end
  end
end
