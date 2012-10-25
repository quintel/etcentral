set :application, "et-model.com"
set :server_type, 'production'
set :deploy_to, "/u/apps/et-model.com"
set :db_host, "etm.cr6sxqj0itls.eu-west-1.rds.amazonaws.com"
set :scm, :git
set :repository,  "git@github.com:quintel/et-model.com.git"
set :user, 'ubuntu'
set :deploy_via, :remote_cache
# Some files that will need proper permissions set
set :chmod755, "app config db lib public vendor script script/* public/disp*"
ssh_options[:forward_agent] = true
set :use_sudo, false
set :bundle_flags, '--deployment --quiet --binstubs --shebang ruby-local-exec'
set :local_db_name, 'et-model.com_dev'

set :branch, "production"
set :domain, "et-model.com"
set :rails_env, "production"
set :application_key, "etmodel"
# set :db_pass, "HaLjXwRWmu60DK"
# set :db_name, application_key
# set :db_user, application_key
set :airbrake_key, "aadd4cc40d52dabf842d4dce932e84a3"
server domain, :web, :app, :db, :primary => true

