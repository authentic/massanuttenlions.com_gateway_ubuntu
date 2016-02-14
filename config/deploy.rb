require "bundler/capistrano"



#############################################################
#	Application
#############################################################
set :application, "massanuttenlions"
set :deploy_to, "/home/massanut/#{application}"

#############################################################
#	Settings
#############################################################

default_run_options[:pty] = true
set :use_sudo, false
ssh_options[:port] = 7822
ssh_options[:keys] = %w(~/.ssh/id_rsa)
set :scm_verbose, true

#############################################################
#	Servers
#############################################################

set :user, "massanut"
set :domain, "massanut.www76.a2hosting.com"
role :web, domain
role :app, domain
role :db, domain, :primary => true
set :bundle_cmd, 'source $HOME/.bash_profile && bundle'

#############################################################
#	Git
#############################################################
set :repository, "git://github.com/authentic/massanuttenlions.com_gateway_ubuntu.git"
set :scm, "git"
set :branch, "master"
set :deploy_via, :remote_cache

after 'deploy', 'deploy:cleanup'

namespace :deploy do
#############################################################
#	Passenger
#############################################################
  task :start do ; end
  task :stop do ; end
  task :restart, :role => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
#############################################################
#	Symlink tasks
#############################################################
  desc "Symlinks the database.yml, google-api.yaml, ckeditor_assets and paperclip_assets folders"
  task :symlink_config_shared, :role => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/google-api.yaml #{release_path}/google-api.yaml"
    run "ln -s #{shared_path}/ckeditor_assets #{release_path}/public/ckeditor_assets"
    run "ln -s #{shared_path}/paperclip_assets #{release_path}/public/paperclip_assets"

  end

  desc "Creates the production log if it does not exist"
  task :create_production_log do
    unless File.exist?(File.join(shared_path, 'log', 'production.log'))
      puts "\n\n=== Creating Production Log! ===\n\n"
      run "touch #{File.join(shared_path, 'log', 'production.log')}"
    end
  end

  # namespace :assets do
  #   desc "Precompile assets on local machine and upload them to the server."
  #   task :precompile, roles: :web, except: {no_release: true} do
  #     run_locally "bundle exec rake assets:precompile RAILS_ENV=development"
  #     find_servers_for_task(current_task).each do |server|
  #       run_locally "rsync -vr  --exclude='.DS_Store' --rsh 'ssh -p #{ssh_options[:port]}' public/assets  #{user}@a2s76.a2hosting.com:#{shared_path}/"
  #     end
  #   end
  # end
#desc "build missing paperclip styles"
#task :build_missing_paperclip_styles, :roles => :app do
#  run "cd #{release_path}; RAILS_ENV=production bundle exec rake paperclip:refresh:missing_styles"
#end
#
#desc "Sync the public/ckeditor_assets directory."
#task :assets do
#  system "rsync -vr --exclude='.DS_Store' public/ckeditor_assets #{user}@#{application}:#{shared_path}/"
#end
end
#after 'deploy:update_code', 'create_production_log'
before 'bundle:install', 'deploy:symlink_config_shared'