# server-based syntax
# ======================
# server '13.231.42.225', user: 'naoya', roles: %w{web app db} # TODO

# role-based syntax
# ==================
role :app, %w{naoya@13.231.42.225} # TODO
role :web, %w{naoya@13.231.42.225} # TODO
role :db, %w{naoya@13.231.42.225} # TODO

# Configuration
# =============
set :stage, :production
set :unicorn_rack_env, "production"
set :branch, 'master' # TODO
set :rails_env, 'production'
set :migration_role, 'db'

# Custom SSH Options
# ==================
server '13.231.42.225',
   user: "naoya",
   roles: %w{web db app},
   ssh_options: {
      port: 22,
      user: "naoya", # overrides user setting above
      keys: %w(~/.ssh/organic_key_rsa),
      forward_agent: true,
      auth_methods: %w(publickey)
   }