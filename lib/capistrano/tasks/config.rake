namespace :config do
  desc 'Uploads config/application.example.yml as the initial application.yml'
  task :upload do
    on roles(:app) do
      config_path = 'config/application.yml'

      if test("[ -f #{shared_path.join config_path} ]")
        info "The #{config_path} file is already there"
      else
        info "Now edit the config file in #{shared_path.join config_path}"
        execute :mkdir, '-p', shared_path.join('config')
        upload! 'config/application.example.yml', shared_path.join(config_path)
      end
    end
  end
end
