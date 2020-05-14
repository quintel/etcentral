# frozen_string_literal: true

# Notifies quintel of feedback being sent through the feedback form
class FeedbackMailer < ActionMailer::Base
  def feedback_email(options)
    @options = options

    mail to: 'info@energytransitionmodel.com',
         from: options[:email],
         subject: 'ETM Feedback'
  end
end
