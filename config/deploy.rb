set :application, 'x0y0.com'
set :user, 'deployer'
set :repo_url, 'https://github.com/francocatena/x0y0.git'

set :format, :pretty
set :log_level, :info

set :deploy_to, "/var/www/#{fetch(:application)}"
set :deploy_via, :remote_cache

set :linked_files, %w{config/application.yml}
set :linked_dirs, %w{log}

set :rbenv_type, :user
set :rbenv_ruby, '2.4.1'

set :keep_releases, 5

namespace :deploy do
  before :check,      'config:upload'
  after  :publishing, :restart
  after  :finishing,  :cleanup
end
