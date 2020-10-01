lock '3.4.0'

set :application, 'organictable' # TODO
set :repo_url, "git@github.com:cocodog-code/OrganicTable.git" # TODO
set :deploy_to, '/var/www/organictable' # TODO
set :log_level, :debug

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets}

# rbenv Ruby version
set :rbenv_ruby, '2.6.6' # TODO

# nokogiri はシステムライブラリを使うため bundle install にオプションを指定する
set :bundle_env_variables, { nokogiri_use_system_libraries: 1 }

namespace :deploy do
  desc 'restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end
after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  desc "Copying database.yml"
  task :config_database do
    on roles(:all) do
      within release_path do
        db_config_file = "/var/www/organictable/shared/database.yml" #TODO
        execute :cp, "#{db_config_file} ./config/database.yml"
      end
    end
  end
  desc "Set Environment Values"
  task :set_env_values do
    on roles(:all) do
      within release_path do
        env_config = "/var/www/organictable/shared/.env"
        execute :cp, "#{env_config} ./.env"
      end
    end
  end
  desc "Set master.key"
  task :config_database do
    on roles(:all) do
      within release_path do
        db_config_file = "/var/www/organictable/shared/master.key" #TODO
        execute :cp, "#{db_config_file} ./config/master.key"
      end
    end
  end
  desc "Restarting application"
  task :restart do
    invoke "unicorn:restart"
  end
end

before "deploy:updated", "deploy:config_database"
before "deploy:updated", "deploy:set_env_values"
after "deploy:publishing", "deploy:restart"