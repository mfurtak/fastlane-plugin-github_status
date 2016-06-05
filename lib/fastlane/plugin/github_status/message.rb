module Fastlane
  module Plugin
    module GitHubStatus
      # Immutable module object representing the last status message
      # provided by GitHub
      class Message
        STATUS_RANKING = ['good', 'minor', 'major'].freeze

        # String representing one of three possible statuses:
        # * 'good' - Everything is OK
        # * 'minor' - GitHub is experiencing minor problems
        # * 'major' - GitHub is experiencing major problems
        attr_reader :status

        # A more descriptive message describing the current situation
        attr_reader :body

        # Time object representing when this status message was
        # created by GitHub
        attr_reader :created_on

        # Expects to be called with a hash of the JSON data
        # returned from the GitHub status API endpoint
        #
        # https://status.github.com/api
        #
        # {
        #   'status' => 'good',
        #   'body' => 'Everything operating normally.',
        #   'created_on' => '2016-06-01T16:40:35Z'
        # }
        def initialize(data_hash)
          @status = data_hash['status']
          @body = data_hash['body']
          @created_on = Time.parse(data_hash['created_on'])
        end

        def status_at_least?(other_status)
          self.class.valid_status?(other_status) && (status_ranking(status) >= status_ranking(other_status))
        end

        def self.valid_status?(status)
          STATUS_RANKING.include?(status)
        end

        private

        def status_ranking(status)
          STATUS_RANKING.find_index(status)
        end
      end
    end
  end
end
