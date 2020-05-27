require 'spec_helper'

describe PagesController do

  describe 'POST feedback' do
    let(:delivered_emails) do
      ActionMailer::Base.deliveries
    end

    let(:feedback_params) do
      {
        name: 'Schwarzenegger',
        email: 'arnold@quintel.com',
        message: "I'll be back"
      }
    end

    before do
      ActionMailer::Base.deliveries = []
      post :send_feedback, xhr: true, params: { feedback: feedback_params }
      response
    end

    context 'with valid parameters' do
      it 'sends an email' do
        expect(delivered_emails.size).to eq(1)
      end

      it 'mails to info@energytransitionmodel.com' do
        expect(delivered_emails.first.to[0]).
          to eq('info@energytransitionmodel.com')
      end

      it 'contains a message' do
        expect(delivered_emails.first.body.raw_source).to include('ll be back')
      end
    end

    context 'with the invisible_captcha field filled in' do
      let(:feedback_params) { super().merge(country: 'NL') }

      it 'does not send an email' do
        expect(delivered_emails.size).to be_zero
      end
    end
  end
end
