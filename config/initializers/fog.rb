FOG_STORAGE ||= Fog::Storage.new({
  :provider => 'AWS',
  :aws_access_key_id => APP_CONFIG[:access_key_id],
  :aws_secret_access_key => APP_CONFIG[:secret_access_key]
  })

FOG_BUCKET ||= FOG_STORAGE.directories.get(APP_CONFIG[:bucket])