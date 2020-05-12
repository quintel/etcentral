require 'spec_helper'

describe PagesController do

  describe 'POST feedback' do
    let(:delivered_emails) do
      ActionMailer::Base.deliveries
    end

    before do
      ActionMailer::Base.deliveries = []
      post :send_feedback, xhr: true, params: { feedback: {
        name: 'Schwarzenegger',
        email: 'arnold@quintel.com',
        message: "I'll be back"
      }}

      response
    end

    it 'sends an email' do
      expect(delivered_emails.size).to eq(1)
    end

    it 'mails to info@energytransitionmodel.com' do
      expect(delivered_emails.first.to[0]).to eq('info@energytransitionmodel.com')
    end

    it 'contains a message' do
      expect(delivered_emails.first.body.raw_source).to eq("I'll be back")
    end
  end
end
