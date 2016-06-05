describe Fastlane::Actions::GithubStatusAction do
  before(:each) do
    Fastlane::Actions::GithubStatusAction.client = instance_double("Fastlane::Plugin::GitHubStatus::Client")
    Fastlane::Actions::GithubStatusAction.ui = instance_double("Fastlane::Plugin::GitHubStatus::UI")
  end

  let(:message) { message_from_response_fixture }

  describe 'running the action' do
    it 'prints the status message' do
      expect(Fastlane::Actions::GithubStatusAction.client).to receive(:last_message).and_return(message)
      expect(Fastlane::Actions::GithubStatusAction.ui).to receive(:print_message).with(message)

      result = Fastlane::FastFile.new.parse("lane :test do
        github_status
      end").runner.execute(:test)

      expect(result).to eq(message)
    end

    it 'aborts if the status is equal to the abort level' do
      last_message = message_from_params('status' => 'minor')
      expect(Fastlane::Actions::GithubStatusAction.client).to receive(:last_message).and_return(last_message)
      expect(Fastlane::Actions::GithubStatusAction.ui).to receive(:print_message).with(last_message)
      allow(Fastlane::Actions::GithubStatusAction.ui).to receive(:status_statement).and_return('status_statement')
      expect(Fastlane::Actions::GithubStatusAction.ui).to receive(:abort!).with(/status_statement/)

      result = Fastlane::FastFile.new.parse("lane :test do
        github_status(abort_level: 'minor')
      end").runner.execute(:test)
    end

    it 'aborts if the status is greater than the abort level' do
      last_message = message_from_params('status' => 'major')
      expect(Fastlane::Actions::GithubStatusAction.client).to receive(:last_message).and_return(last_message)
      expect(Fastlane::Actions::GithubStatusAction.ui).to receive(:print_message).with(last_message)
      allow(Fastlane::Actions::GithubStatusAction.ui).to receive(:status_statement).and_return('status_statement')
      expect(Fastlane::Actions::GithubStatusAction.ui).to receive(:abort!).with(/status_statement/)

      result = Fastlane::FastFile.new.parse("lane :test do
        github_status(abort_level: 'minor')
      end").runner.execute(:test)
    end
  end

  describe 'option validation' do
    it "does not allow 'good' status for abort_level" do
      expect do
        Fastlane::FastFile.new.parse("lane :test do
          github_status(abort_level: 'good')
        end").runner.execute(:test)
      end.to raise_error(FastlaneCore::Interface::FastlaneError, /must be one of/)
    end

    it 'does not allow invalid status values for abort_level' do
      expect do
        Fastlane::FastFile.new.parse("lane :test do
          github_status(abort_level: 'not valid')
        end").runner.execute(:test)
      end.to raise_error(FastlaneCore::Interface::FastlaneError, /must be one of/)
    end
  end
end
