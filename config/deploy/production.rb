# server-based syntax
# ======================
server '13.231.42.225', user: 'naoya', roles: %w{web app db} # TODO

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
set :ssh_options, {
  keys: 'Users/naoya/.ssh/organic_key_rsa', # TODO
  forward_agent: true,
  auth_methods: %w(publickey)
}