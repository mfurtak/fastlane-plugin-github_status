module Fastlane
  module Plugin
    module GitHubStatus
      class Options
        # Excludes 'good' as a valid choice for wanting to abort the build
        ABORT_STATUSES = Plugin::GitHubStatus::Message::STATUS_RANKING.drop(1)
        ABORT_CHOICES = "'#{ABORT_STATUSES.join("', '")}'"

        def self.available_options
          [
            FastlaneCore::ConfigItem.new(key: :abort_level,
                                    env_name: "GITHUB_STATUS_ABORT_LEVEL",
                                 description: "The GitHub status at or above which execution should abort. Valid values are: #{ABORT_CHOICES}",
                                    optional: true,
                                        type: String,
                               default_value: nil,
                                verify_block: proc do |value|
                                                valid = value.nil? || ABORT_STATUSES.include?(value)

                                                unless valid
                                                  FastlaneCore::UI.user_error!("abort_level must be one of: #{ABORT_CHOICES}")
                                                end
                                              end)
          ]
        end
      end
    end
  end
end
