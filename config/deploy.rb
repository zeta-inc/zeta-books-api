# config valid only for current version of Capistrano
lock '3.4.0'

set :rbenv_ruby, '2.1.2'

set :application, 'zeta-books-api'
set :repo_url, 'git@github.com:flavray/zeta-books-api.git'

# Default branch is :master
#ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, 'master'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/zeta-books-api'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w(config/database.yml config/secrets.yml)

# Default value for linked_dirs is []
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle public)

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :user, 'zeta-books-api'
set :use_sudo, false

set :migration_role, 'migrator'
set :conditionally_migrate, true
set :deploy_via, :copy
set :keep_releases, 3
set :assets_roles, [:web, :app]

namespace :deploy do
  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join("tmp/restart.txt")
    end
  end
end
