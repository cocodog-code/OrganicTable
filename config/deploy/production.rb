server '13.231.42.225', user: "naoya", roles: %w(web db app)

set :ssh_options, {
  port: 22,
  user: "naoya", # overrides user setting above
  keys: ["#{ENV.fetch('PRODUCTION_SSH_KEY')}"],
  forward_agent: true,
  auth_methods: %w(publickey),
}
