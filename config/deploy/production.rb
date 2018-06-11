set :stage, :production
set :branch, 'master'
set :ssh_options, {
  keys: %w(~/.ssh/oyamada-private-aws.pem),
  auth_methods: %w(publickey)
}
role :web, %w{ec2-13-230-82-108.ap-northeast-1.compute.amazonaws.com}
server '13.230.82.108', user: 'ec2-user', roles: %w{web}
fetch(:default_env).merge!(rails_env: :production)
