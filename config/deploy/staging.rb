require 'net/ssh/proxy/command'

set :stage, :staging
set :branch,    "master"
set :rails_env, "staging"

set :deploy_to, "/home/belighted/quizzighted"


role :app, %w{10.10.20.50}
role :web, %w{10.10.20.50}
role :db,  %w{10.10.20.50}, primary: true

server '10.10.20.50',
       ssh_options: {
           port: 22,
           user: 'belighted',
           proxy: Net::SSH::Proxy::Command.new('ssh belighted@gateway.belighted.com -p 6969 -W %h:%p'),
       }

