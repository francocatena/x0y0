set :stage, :production
set :rails_env, 'production'

role :all, %w{x0y0.com}

server 'x0y0.com', user: 'deployer', roles: %w{web app db}
