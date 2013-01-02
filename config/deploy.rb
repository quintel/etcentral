set :application, "et-model.com"
set :server_type, 'production'
set :deploy_to, "/u/apps/et-model.com"
set :scm, :git
set :repository,  "git@github.com:quintel/et-model.com.git"
set :user, 'ubuntu'
set :deploy_via, :remote_cache
# Some files that will need proper permissions set
set :chmod755, "app config db lib public vendor script script/* public/disp*"
ssh_options[:forward_agent] = true
set :use_sudo, false
set :bundle_flags, '--deployment --quiet --binstubs --shebang ruby-local-exec'

set :branch, "production"
set :domain, "et-model.com"
set :rails_env, "production"
set :application_key, "etmodel"

set :airbrake_key, "<airbrake_key>"
server domain, :web, :app, :primary => true

