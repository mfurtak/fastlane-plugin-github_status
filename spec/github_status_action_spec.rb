describe Fastlane::Actions::GithubStatusAction do
  before(:each) do
    Fastlane::Actions::GithubStatusAction.client = instance_double("Fastlane::Plugin::GitHubStatus::Client")
    Fastlane::Actions::GithubStatusAction.ui = instance_double("Fastlane::Plugin::GitHubStatus::UI")
  end

  let(:message) { message_from_response_fixture }

  describe '#run' do
    it 'prints the status message' do
      expect(Fastlane::Actions::GithubStatusAction.client).to receive(:last_message).and_return(message)
      expect(Fastlane::Actions::GithubStatusAction.ui).to receive(:print_message).with(message)

      Fastlane::Actions::GithubStatusAction.run(nil)
    end
  end
end
