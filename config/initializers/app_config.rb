config_path = Rails.root + 'config' + 'application.yml'

if File.exists?(config_path)
  APPLICATION = YAML.load config_path.read
else
  raise "You must have a configuration file in #{config_path}, see config/application.example.yml"
end
