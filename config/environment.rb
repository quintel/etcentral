# Load the rails application
require File.expand_path('../application', __FILE__)

# Load global config
raw_config = File.read("#{Rails.root}/config/config.yml")
APP_CONFIG = YAML.load(raw_config)[Rails.env].symbolize_keys
# Initialize the rails application
EtModelCom::Application.initialize!
