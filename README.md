# OakCreekDB

OakCreekDB is a web-based DBMS for managing Oak Creek Zoological Conservatory's animal information.

## Installation

Make sure you have installed all of the following prerequisites on your Linux machine:
* [Ruby](https://www.ruby-lang.org/en/) - You should have Ruby 2.6.3 installed.
* [Rails](https://rubyonrails.org/) - You should have Rails 6.0.0 installed.

```bash
$ rvm install ruby-2.6.3
$ rvm use 2.6.3
$ gem install rails --version=6.0.0
```

Install [Bundler](https://bundler.io/) 2:

```bash
$ gem install bundler
$ bundle install --without production
```

## Configuration

Local first-time database creation and initialization:

```bash
$ rails db:migrate
$ rails db:seed
```

## Deployment

If you have deployed to Heroku before, just create a new app container with `heroku create`.  If this is your first time deploying to Heroku, you will need to do two things.  First, sign up for a free [Heroku account](http://heroku.com).  Then set up `ssh` keys to securely communicate with Heroku for app deployments.  The three basic commands you need are the following, but see the [Heroku page](https://devcenter.heroku.com/articles/heroku-cli) for more details.

```bash
$ ssh-keygen -t rsa
$ heroku login
$ heroku keys:add
```

Once your keys are set up (a one-time process), you should be able to create an "app container" on Heroku into which you'll deploy:

```bash
$ heroku create
```

Finally, deploy the app to Heroku:

```bash
$ git push heroku master
```

If you have problems deploying to Heroku, please see this [post](https://stackoverflow.com/questions/13083399/heroku-deployment-failed-because-of-sqlite3-gem-error).

Just as we ran `rails db:migrate` and `rails db:seed` to do first-time database creation locally, we must also cause a database to be created on the Heroku side:

```bash
$ heroku run rails db:migrate
```

and

```bash
$ heroku run rails db:seed
```

Now you should be able to navigate to your app's URL. 

[Source](https://github.com/saasbook/rottenpotatoes-rails-intro/blob/master/instructions/docs/part_0_B.md)

## License
MIT License

Copyright (c) [2019] [fullname]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

<!--
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
-->