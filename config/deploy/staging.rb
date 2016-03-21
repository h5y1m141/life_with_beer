set :stage, :production
set :branch, 'develop'
role :web, %w{ops@localhost}
server 'localhost', user: 'ops', roles: %w{web}
set :ssh_options, {
  user: 'ops',
  port: 12222,
  keys: ['./provision/ssh_key/id_rsa'],
  forward_agent: true,
  auth_methods: %w(publickey)
}
