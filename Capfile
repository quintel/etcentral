require 'bundler/capistrano'

load 'deploy'

# we need this to precompile assets
load 'deploy/assets'

Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy' # remove this line to skip loading any of the default tasks
load 'lib/capistrano/unicorn.rb'
