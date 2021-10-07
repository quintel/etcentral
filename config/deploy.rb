lock '3.16.0'

set :log_level, 'info'

set :application, 'etcentral'
set :repo_url, 'git@github.com:quintel/etcentral.git'

# rbenv Options
# =============

set :rbenv_type, :system
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, "#{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w[bundle gem rails rake ruby]


# Puma Options
# ============
#
# If these are changed, be sure to then run `cap $stage puma:config`; the config
# on the server is not automatically updated when deploying.

set :puma_init_active_record, true
set :puma_preload_app, true
set :puma_systemctl_user, :user
set :puma_service_unit_env_vars, ["RBENV_ROOT=#{fetch(:rbenv_path)}"]

# Bundler Options
# ===============

set :bundle_binstubs, (-> { shared_path.join('sbin') })

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w[config/secrets.yml config/email.yml]

# Default value for linked_dirs is []
set :linked_dirs, %w[sbin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system]

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end
