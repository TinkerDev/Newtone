set :stage, :production
server 'new.newtone.name', user: 'wwwnewtone', roles: %w{web app db}
set :ssh_options, {
    forward_agent: true,
    port: 201
}
set :rails_env, :production
fetch(:default_env).merge!(rails_env: :production)
