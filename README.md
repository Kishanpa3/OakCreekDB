# OakCreekDB

OakCreekDB is a web-based DBMS for managing Oak Creek Zoological Conservatory's animal information.

## Installation

Make sure you have installed all of the following prerequisites on your Linux machine:
* [Ruby](https://www.ruby-lang.org/en/) - You should have Ruby 2.6.3 installed.
* [Rails](https://rubyonrails.org/) - You should have Rails 6.0.0 installed.
* [Node.js 8.16.0+](https://nodejs.org/en/) - You should have Node.js installed.
* [Yarn 1.x+](https://yarnpkg.com/lang/en/) - [Download & Install Yarn](https://yarnpkg.com/lang/en/docs/install/#debian-stable).

Install Ruby and Rails:
```bash
$ rvm install ruby-2.6.3
$ rvm use 2.6.3
$ gem install rails --version=6.0.0
```

Install [Bundler](https://bundler.io/) 2:

```bash
$ gem install bundler
```
Install the gems:

```bash
$ bundle install --without production
```

## Configuration

First-time local database creation and initialization:

```bash
$ rails db:migrate
$ rails db:seed
```

If using Amazon S3 for file uploads, run `rails credentials:edit` and put your S3 credentials, and [setup CORS](http://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html):

```yaml
access_key_id: "..."
secret_access_key: "..."
region: "..."
bucket: "..."

secret_key_base "..."
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

<!--If you have problems deploying to Heroku, please see this [post](https://stackoverflow.com/questions/13083399/heroku-deployment-failed-because-of-sqlite3-gem-error).-->

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

## References
* [Shrine](https://github.com/shrinerb/shrine) gem - File uploading

## License
This project is licensed under the terms of the [MIT](https://choosealicense.com/licenses/mit/) license.

<!--
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