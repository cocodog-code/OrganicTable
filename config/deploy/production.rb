# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server "www.organictable.xyz", user: 'naoya', roles: %w{app db web} 

#デプロイするサーバーにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/organic_key_rsa', forward_agent: true
