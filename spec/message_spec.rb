describe Fastlane::Plugin::GitHubStatus::Message do
  describe 'construction' do
    it "initializes from a JSON response" do
      message = message_from_response_fixture

      expect(message.status).to eq('good')
      expect(message.body).to eq('Everything operating normally.')
      expect(message.created_on).to eq(Time.parse('2016-06-01T16:40:35Z'))
    end
  end

  describe '#status_at_least?' do
    it 'returns true when its status is equal' do
      message = message_from_params('status' => 'good')
      expect(message.status_at_least?('good')).to be(true)
    end

    it 'returns true when its status is greater' do
      message = message_from_params('status' => 'major')
      expect(message.status_at_least?('minor')).to be(true)
    end

    it 'returns false when the its status is lesser' do
      message = message_from_params('status' => 'minor')
      expect(message.status_at_least?('major')).to be(false)
    end

    it 'returns false when the compared status is invalid' do
      message = message_from_params('status' => 'minor')
      expect(message.status_at_least?('not real')).to be(false)
    end

    it 'returns false when the compared status is nil' do
      message = message_from_params('status' => 'minor')
      expect(message.status_at_least?(nil)).to be(false)
    end
  end
end
