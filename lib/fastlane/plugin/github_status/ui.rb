module Fastlane
  module Plugin
    module GitHubStatus
      class UI
        FastlaneUI = FastlaneCore::UI

        STATUS_TO_COLOR = {
          'good' => :green,
          'minor' => :yellow,
          'major' => :red
        }.freeze

        def print_message(message)
          FastlaneUI.message ''
          FastlaneUI.message "GitHub status is: #{build_statement(message)}"
          FastlaneUI.message "Last updated: #{format_date(message.created_on)}"
          FastlaneUI.message ''
        end

        def build_statement(message)
          status = message.status
          colorize_for_status(status, "#{status.upcase} - #{message.body}")
        end

        def colorize_for_status(status, message)
          color = STATUS_TO_COLOR[status]
          message.send(color) if color
        end

        def format_date(date_string)
          DateTime.parse(date_string).to_time.to_s
        end
      end
    end
  end
end
