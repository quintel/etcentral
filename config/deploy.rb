set :application, "etcentral"
set :repository,  "git@github.com:quintel/etcentral.git"

set :scm, :git

role :web, "new.et-model.com" # Your HTTP server, Apache/etc
role :app, "new.et-model.com" # This may be the same as your `Web` server

set :user, "ubuntu"

set :bundle_flags, '--deployment --quiet --binstubs --shebang ruby-local-exec'

# Some files that will need proper permissions set
set :chmod755, "app config db lib public vendor script script/* public/disp*"
ssh_options[:forward_agent] = true
set :use_sudo, false

after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
