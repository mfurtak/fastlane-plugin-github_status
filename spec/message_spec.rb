describe Fastlane::Plugin::GitHubStatus::Message do
  describe 'construction' do
    it "initializes from a JSON response" do
      message = message_from_response_fixture

      expect(message.status).to eq('good')
      expect(message.body).to eq('Everything operating normally.')
      expect(message.created_on).to eq(Time.parse('2016-06-01T16:40:35Z'))
    end
  end
end
