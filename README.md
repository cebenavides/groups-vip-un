# Robotics & Signal Processing groups manager
This is a Ruby on Rails application created to showcase the research groups under the supervision of professor Winston Percybrooks. The registered students can modify the page of the group they are associated to and add information such as images and the publications they have made.

## Getting started
The application uses a bunch of gems you should install running the "bundle update" command, but aside from that be sure to have installed SQLite and ImageMagick.

Once you've cloned the repository, you should manually create an Admin user for the first time. Load the rails console and execute the following comand:
```
Admin.create(email: 'example@example.com', password: 'example', password_confirmation: 'example')
```

## Deployment
For deploying the application I recommend following the GoRails tutorial located in https://gorails.com/deploy/ubuntu/16.04, but considering to install the 2.4.1 version of Ruby instead of the 2.4.0. The app works with MySQL in production mode, so have that in mind when setting stuff up. Again, remember installing ImageMagick for the Paperclip gem to work as expected.

Once you've configured everything you should run the next command from the computer you're developing everytime you want the server to be updated with the new changes:
```
cap production deploy
```
It is also necessary to manually create an Admin user for the first time. For doing that, ssh into your server and follow the next steps
```
cd /home/vipweb/groups-vip-un/current
RAILS_ENV=production bundle exec rails c
```
When the rails console has loaded, execute the same command explained in the "Getting started" section.

## Suggestions
Of course, I realize there are things to improve and so I would appreciate any kind of advices you have in order to improve the functioning and usability of the application.
