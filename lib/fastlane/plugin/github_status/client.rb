module Fastlane
  module Plugin
    module GitHubStatus
      class Client
        API_ENDPOINT = 'https://status.github.com/api'.freeze

        def last_message
          JSON.parse(open("#{API_ENDPOINT}/last-message.json").read, symbolize_names: true)
        end
      end
    end
  end
end
