require "bundler/capistrano"

server "82.196.13.127", :web, :app, :db, primary: true

set :application, "rpasswrd"
set :user, "rails"
#set :deploy_to, "/home/#{user}/#{application}"
set :deploy_to, "/home/#{user}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@bitbucket.org:TheSilverBadger/rpasswrd.git"
set :branch, "cap"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end
end