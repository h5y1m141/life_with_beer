set :stage, :production
set :branch, 'master'
role :web, %w{160.16.208.241}
server '160.16.208.241', user: 'ops', roles: %w{web}
fetch(:default_env).merge!(rails_env: :production)
