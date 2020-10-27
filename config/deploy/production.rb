server '13.231.42.225', user: "naoya", roles: %w(web db app)

set :ssh_options, {
  port: 22,
  user: "naoya", # overrides user setting above
  keys: %w(~/.ssh/organic_key_rsa),
  forward_agent: true,
  auth_methods: %w(publickey),
}
