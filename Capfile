require 'bundler/capistrano'
require 'airbrake/capistrano'

load 'deploy'

load 'lib/capistrano/solr'

# we need this to precompile assets
load 'deploy/assets'

Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy' # remove this line to skip loading any of the default tasks
load 'lib/capistrano/unicorn.rb'
