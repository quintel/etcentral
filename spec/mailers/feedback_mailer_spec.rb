# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FeedbackMailer do
  describe '.allowed_message?' do
    it 'allows "hello there!"' do
      expect(described_class.allowed_message?('hello there!')).to be(true)
    end

    it 'allows "this is my domain"' do
      expect(described_class.allowed_message?('this is my domain')).to be(true)
    end

    it 'allows "renew your account"' do
      expect(described_class.allowed_message?('renew your account')).to be(true)
    end

    it 'rejects "renew your domain"' do
      expect(described_class.allowed_message?('renew your domain')).to be(false)
    end

    it 'rejects "RENEW your domain"' do
      expect(described_class.allowed_message?('RENEW your domain')).to be(false)
    end
  end

  describe '.allowed_sender?' do
    it 'rejects "info@energytransitionmodel.com"' do
      expect(described_class.allowed_sender?('info@energytransitionmodel.com')).to be(false)
    end

    it 'allows ""' do
      expect(described_class.allowed_sender?('')).to be(true)
    end

    it 'allows "me@example.com"' do
      expect(described_class.allowed_sender?('me@example.com')).to be(true)
    end
  end
end
