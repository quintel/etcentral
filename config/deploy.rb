set :application, "etcentral"
set :repository,  "git@github.com:quintel/etcentral.git"

set :scm, :git

set :user, "ubuntu"

set :bundle_flags, '--deployment --quiet --binstubs --shebang ruby-local-exec'

set :chmod755, "app config db lib public vendor script script/* public/disp*"
ssh_options[:forward_agent] = true
set :use_sudo, false

task :staging do
  set :branch, fetch(:branch, 'staging')
  set :domain, 'beta.et-model.com'
  set :rails_env, 'staging'
  set :application_key, 'etcentral_staging'
  set :airbrake_key, "64e97ea964161781f41d9d7e94c9c256"
  server domain, :web, :app
end

task :production do
  set :branch, fetch(:branch, 'production')
  set :domain, 'et-model.com'
  set :rails_env, 'production'
  set :application_key, 'etcentral'
  set :airbrake_key, "03bc16d0ad22cb6680c0fad7a58c4582"
  server domain, :web, :app
end

after "deploy:restart", "deploy:cleanup"
