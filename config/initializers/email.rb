X0Y0::Application.configure do
  config.action_mailer.default_url_options = {
    host: APPLICATION['host'],
    protocol: (Rails.env.production? ? 'https' : 'http')
  }
  config.action_mailer.default_url_options[:port] = 3000 if Rails.env.development?

  config.action_mailer.smtp_settings = APPLICATION['smtp'].symbolize_keys
end
