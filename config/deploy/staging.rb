# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

# role :app, %w{massanut.www76.a2hosting.com}
# role :web, %w{massanut.www76.a2hosting.com}
# role :db,  %w{massanut.www76.a2hosting.com}
#
#
# # Extended Server Syntax
# # ======================
# # This can be used to drop a more detailed server definition into the
# # server list. The second argument is a, or duck-types, Hash and is
# # used to set extended properties on the server.
#
# server 'massanut.www76.a2hosting.com', user: 'massanut', roles: %w{web app db} ,port: 7822, password: fetch(:password)#my_property: :my_value

# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
# set :ssh_options, {
#     user: fetch(:user),
#     password: fetch(:password),
#     keys: %w(/home/.ssh/id_rsa),
#     port:7822,
#     forward_agent: true,
#     auth_methods: %w(publickey)
# }

#
# And/or per server (overrides global)
# ------------------------------------
#  server 'example.com',
#    user: 'user_name',
#    roles: %w{web app},
#    ssh_options: {
#      user: 'user_name', # overrides user setting above
#      keys: %w(/home/.ssh/id_rsa),
#      forward_agent: false,
    # auth_methods: %w(publickey password)
     # password: 'please use keys'
  # }
