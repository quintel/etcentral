# frozen_string_literal: true

# Notifies quintel of feedback being sent through the feedback form
class FeedbackMailer < ActionMailer::Base
  # Public: Returns if the message is one we want to send. Silently rejects spam messages about
  # domain renewals.
  def self.allowed_message?(message)
    message = message.to_s.downcase
    !(message.include?('domain') && message.include?('renew'))
  end

  def feedback_email(options)
    @options = options

    mail to: 'info@energytransitionmodel.com',
         from: options[:email],
         subject: 'ETM Feedback'
  end
end
