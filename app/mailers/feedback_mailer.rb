# frozen_string_literal: true

# Notifies quintel of feedback being sent through the feedback form
class FeedbackMailer < ActionMailer::Base
  # Public: Returns if the message params are allowed to be sent as a message.
  def self.allowed?(params)
    allowed_message?(params[:message]) && allowed_sender?(params[:email])
  end

  # Public: Returns if the message is one we want to send. Silently rejects spam messages about
  # domain renewals.
  def self.allowed_message?(message)
    !prohibited_content?(message.to_s.downcase)
  end

  def self.prohibited_content?(message)
    (message.include?('renew') && message.include?('domain')) ||
      message.include?('porn')
  end

  private_class_method :prohibited_content?

  # Public: Returns if the sender's e-mail is allowed to send messages. Silently rejects messages
  # from spammers (which, for some reason, seem to use our own address in the form).
  def self.allowed_sender?(email)
    !email.to_s.downcase.end_with?('@energytransitionmodel.com')
  end

  def feedback_email(options)
    @options = options

    mail to: 'info@energytransitionmodel.com',
         from: options[:email],
         reply_to: options[:email],
         subject: 'ETM Feedback'
  end
end
