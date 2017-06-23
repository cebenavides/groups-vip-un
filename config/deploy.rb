# config valid only for current version of Capistrano
# lock "3.8.1"

set :application, "groups-vip-un"
set :repo_url, "git@github.com:cebenavides/groups-vip-un.git"

set :deploy_to, '/home/vipweb/groups-vip-un'

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"