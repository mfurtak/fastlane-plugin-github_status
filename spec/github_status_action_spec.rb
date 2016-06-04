describe Fastlane::Actions::GithubStatusAction do
  describe '#run' do
    it 'prints a message' do
      allow(Fastlane::UI).to receive(:message)
      expect(Fastlane::UI).to receive(:message).with("The github_status plugin is working!")

      Fastlane::Actions::GithubStatusAction.run(nil)
    end
  end
end
