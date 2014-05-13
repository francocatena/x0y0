set :application, 'x0y0.com'
set :user, 'deployer'
set :repo_url, 'git://github.com/francocatena/x0y0.git'

set :format, :pretty
set :log_level, :info

set :deploy_to, "/var/www/#{fetch(:application)}"
set :deploy_via, :remote_cache
set :scm, :git

set :linked_files, %w{config/application.yml}
set :linked_dirs, %w{log}

set :rbenv_type, :user
set :rbenv_ruby, '2.1.2'

set :keep_releases, 5

namespace :deploy do
  after :publishing, :restart
  after :finishing,  'deploy:cleanup'
end
