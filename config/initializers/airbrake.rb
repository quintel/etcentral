Airbrake.configure do |config|
  config.api_key = APP_CONFIG[:airbrake_api_key]
end if APP_CONFIG[:airbrake_api_key].present?