# # config valid only for current version of Capistrano
# lock '3.3.3'
#
# set :application, 'massanuttenlions'
# set :deploy_user, 'massanut'
# # setup repo details
# set :repo_url, 'git://github.com/authentic/massanuttenlions.com.git'
# set :scm, :git
#
# # how many old releases do we want to keep
# set :keep_releases, 5
# # files we want symlinking to specific entries in shared.
# set :linked_files, %w{config/database.yml config/.google-api.yaml}
# # dirs we want symlinking to shared
# set :linked_dirs, %w(ckeditor_assets paperclip_assets log)
#
#
#
# set :format, :pretty
# set :pty, true
# #set :scm_verbose, true
# #set :bundle_cmd, 'source $HOME/.bash_profile && bundle'
# #set :use_sudo, false
# #set :deploy_via, :remote_cache
# # Default value for :linked_files is []
#
# # SSHKit.config.output_verbosity = :debug
# #SSHKit.config.output = $stdout
# #SSHKit.config.output_verbosity = Logger::DEBUG
# #SSHKit.config.command_map[:rake] = "bundle exec rake"
# #SSHKit.config.command_map[:rails] = "bundle exec rails"
#
# # desc "Symlinks the database.yml, .google-api.yaml, ckeditor_assets and paperclip_assets folders"
# # task :symlink_config_shared do
# #   on roles(:app) do
# #     execute "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
# #     execute "ln -nfs #{shared_path}/config/.google-api.yaml #{release_path}/.google-api.yaml"
# #     execute "ln -s #{shared_path}/ckeditor_assets #{release_path}/public/ckeditor_assets"
# #     execute "ln -s #{shared_path}/paperclip_assets #{release_path}/public/paperclip_assets"
# #   end
# # end
#
#
#
# # Default value for linked_dirs is []
# # set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
#
# # Default value for default_env is {}
# # set :default_env, { path: "/opt/ruby/bin:$PATH" }
#
# # Default value for keep_releases is 5
# set :keep_releases, 5
#
# namespace :deploy do
#   #before :deploy, "deploy:check_revision"
#   # on roles :all do
#   #   within fetch(:latest_release_directory) do
#   #     with rails_env: fetch(:rails_env) do
#   #       execute :rake, 'assets:precompile'
#   #     end
#   #   end
#   # end
#   after :publishing, :restart
#   # after :restart, :clear_cache do
#   #   on roles(:web), in: :groups, limit: 3, wait: 10 do
#   #     # Here we can do anything such as:
#   #     # within release_path do
#   #     #   execute :rake, 'cache:clear'
#   #     # end
#   #   end
#   # end
#
#  # before :finishing, 'linked_files:upload'
#   after :finishing, 'deploy:cleanup'
#
# end
#
#
#
#
# # desc "Creates the production log if it does not exist"
# # task :create_production_log do
# #   unless File.exist?(File.join(shared_path, 'log', 'production.log'))
# #     puts "\n\n=== Creating Production Log! ===\n\n"
# #     run "touch #{File.join(shared_path, 'log', 'production.log')}"
# #   end
# # end
# #after 'deploy:update_code', 'create_production_log'

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