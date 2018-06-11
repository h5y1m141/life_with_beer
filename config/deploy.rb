set :application, 'life_with_beer'
set :repo_url, 'git@github.com:h5y1m141/life_with_beer.git'

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/home/ec2-user/life_with_beer'
set :scm, :git
set :format, :pretty
set :log_level, :debug
set :pty, true

# sharedへsymlinkを貼るものを指定
set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{public/uploads vendor/bundle}

SSHKit.config.command_map[:rake]  = "bundle exec rake"
SSHKit.config.command_map[:rails] = "bundle exec rails"

namespace :deploy do

  after 'deploy:publishing', 'deploy:restart'
  namespace :deploy do
    task :restart do
      invoke 'unicorn:restart'
    end
  end

end
namespace :utils do
  task :bundle_exec_install do
    on roles(:web) do
      execute 'bash -lc "cd /home/ops/life_with_beer/current;bundle install --path /home/ops/life_with_beer/shared/vendor/bundle"'
    end
  end
  task :after_deploy do
    on roles(:web) do
      execute 'bash -lc "kill `cat /home/ops/life_with_beer/shared/tmp/pids/unicorn.pid`;cd /home/ops/life_with_beer/current/;bundle install --path vendor/bundle;./bin/rake db:migrate RAILS_ENV=production;bundle exec rake assets:precompile RAILS_ENV=production;bundle exec rake unicorn:start"'
    end
  end
  task :bundle_update do
    on roles(:web) do
      execute 'bash -lc "cd /home/ops/life_with_beer/current/;bundle update'
    end
  end
end
