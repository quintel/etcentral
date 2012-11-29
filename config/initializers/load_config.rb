raw_config = File.read("#{Rails.root}/config/config.yml")
APP_CONFIG = YAML.load(raw_config)[Rails.env].symbolize_keys

Airbrake.configure do |config|
  config.api_key = APP_CONFIG[:airbrake_api_key]
end if APP_CONFIG[:airbrake_api_key].present?

FOG_STORAGE ||= Fog::Storage.new({
  :provider => 'AWS',
  :aws_access_key_id => APP_CONFIG[:access_key_id],
  :aws_secret_access_key => APP_CONFIG[:secret_access_key]
  })

FOG_BUCKET ||= FOG_STORAGE.directories.get(APP_CONFIG[:bucket])