describe Fastlane::Plugin::GitHubStatus::UI do
  let(:ui) { Fastlane::Plugin::GitHubStatus::UI.new }

  describe '#colorize_for_status' do
    it "makes 'good' messages green" do
      expect(ui.colorize_for_status('good', 'text')). to eq('text'.green)
    end

    it "makes 'minor' messages yellow" do
      expect(ui.colorize_for_status('minor', 'text')). to eq('text'.yellow)
    end

    it "makes 'major' messages red" do
      expect(ui.colorize_for_status('major', 'text')). to eq('text'.red)
    end
  end

  describe '#print_message' do
    it 'prints the status message to the screen' do
      allow(FastlaneCore::UI).to receive(:message)
      expect(FastlaneCore::UI).to receive(:message).with(/GitHub status is:/)
      expect(FastlaneCore::UI).to receive(:message).with(/Last updated:/)

      ui.print_message(message_from_response_fixture)
    end
  end
end
