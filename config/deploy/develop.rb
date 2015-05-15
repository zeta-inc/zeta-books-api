set :stage, :develop
set :rails_env, 'development'
set :branch, 'develop'

server 'ec2-52-25-29-38.us-west-2.compute.amazonaws.com',
       user: 'zeta-books-api',
       roles: %w{web app db},
       ssh_options: {
         keys: %w(../zeta.pem),
         forward_agent: true,
       }
