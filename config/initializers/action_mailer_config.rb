# frozen_string_literal: true

if Rails.env.production? || Rails.env.staging?
  email_settings = YAML.safe_load(
    File.read("#{Rails.root}/config/email.yml"),
    symbolize_names: true
  )

  if email_settings[Rails.env.to_sym]
    ActionMailer::Base.smtp_settings = email_settings[Rails.env.to_sym]
  end
end
