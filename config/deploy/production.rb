set :stage, :production
set :rails_env, 'production'

role :web, %w{deployer@x0y0.com}
role :app, %w{deployer@x0y0.com}
role :db,  %w{deployer@x0y0.com}

server 'x0y0.com', user: 'deployer', roles: %w{web app db}
