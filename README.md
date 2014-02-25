Future.me
=========

Future.me is a AngularJS/D3.js clientside application that runs on top of a Rails 3.2.16 that scrapes data from LinkedIn and stores and serves it from a sqlite3 database.

Up and Running
==============

To run a local version of the application:

- fork and clone the repo
- bundle install
- rake db:migrate
- replace development.sqlite3 with what we give you (data upon request)
- add application.yml to config/ (data upon request)
- sign in with linkedin
- then sign UP for this app, not sign in (you've authorized the app to use linkedin, but you also have to create an account with the app)
- then wait for ~30 seconds for visualization to load
