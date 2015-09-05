# role :app, %w{massanut.www76.a2hosting.com}
# role :web, %w{massanut.www76.a2hosting.com}
# role :db,  %w{massanut.www76.a2hosting.com}
#
# set :stage, :production
# set :branch, "master"
#
# set :password, ask('Server password', nil)
# server 'massanut.www76.a2hosting.com', user: 'massanut', roles: %w{web app}, port: 7822, password: fetch(:password)#my_property: :my_value
#
# SSHKit::Backend::Netssh.configure do |ssh|
#   ssh.connection_timeout = 100
#   ssh.ssh_options = {
#       user: 'massanut',
#       password: fetch(:password),
#       port:7822,
#       forward_agent: true,
#       auth_methods: %w(password)
#   }
# end
#
# set :deploy_to, '/home/massanut/massanuttenlions'
# set :rails_env, :production
#
#
#
#
