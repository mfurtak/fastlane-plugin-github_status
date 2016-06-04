module Fastlane
  module Plugin
    module GitHubStatus
      class Message
        attr_reader :status
        attr_reader :body
        attr_reader :created_on

        def initialize(options_hash)
          @status = options_hash[:status]
          @body = options_hash[:body]
          @created_on = Time.parse(options_hash[:created_on])
        end
      end
    end
  end
end
