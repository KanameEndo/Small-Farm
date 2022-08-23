server '3.114.161.24', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/endokaname/.ssh/id_rsa'