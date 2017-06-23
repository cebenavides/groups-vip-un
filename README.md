# VIP groups website
This is a Ruby on Rails application created to showcase the research groups under the Vertically Integrated Projects (VIP) program under
the tutoring of professor Winston Percybrooks. The registered students can modify the page of the group they are associated to and add 
information such as images and the publications they have made.

## Deployment
For deploying the application I recommend following the GoRails tutorial located in https://gorails.com/deploy/ubuntu/16.04, but considering to install the 2.4.1 version of Ruby instead of the 2.4.0.

It is also necessary to manually create an Admin user for the first time. For doing that, ssh into your server and follow the next steps
```
cd /home/vipweb/groups-vip-un/current
RAILS_ENV=production bundle exec rails c
```
When the rails console has loaded, execute the following comand:
```
Admin.create(email: 'example@example.com', password: 'example', password_confirmation: 'example')
```
