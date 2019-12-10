# OakCreekDB

OakCreekDB is a web-based DBMS for managing Oak Creek Zoological Conservatory's animal information.

## Installation

Make sure you have installed all of the following prerequisites on your Linux machine:
* [Ruby](https://www.ruby-lang.org/en/) - You should have Ruby 2.6.3 installed.
* [Rails](https://rubyonrails.org/) - You should have Rails 6.0.0 installed.
* [Node.js 8.16.0+](https://nodejs.org/en/) - You should have Node.js installed.
* [Yarn 1.x+](https://yarnpkg.com/lang/en/) - [Download & Install Yarn](https://yarnpkg.com/lang/en/docs/install/#debian-stable).
* [ImageMagick](https://imagemagick.org/script/download.php)

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

If using Amazon S3 for file uploads, put your S3 credentials in `application.yml`, and [setup CORS](http://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html):
```yaml
S3_BUCKET: "..."
S3_ACCESS_KEY_ID: "..."
S3_SECRET_ACCESS_KEY: "..."
S3_REGION: "..."

SHRINE_SECRET_KEY_BASE: "..."
```

<!--
If using Amazon S3 for file uploads, run `rails credentials:edit` and put your S3 credentials, and [setup CORS](http://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html):

```yaml
access_key_id: "..."
secret_access_key: "..."
region: "..."
bucket: "..."

secret_key_base "..."
```
-->
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

## AWS S3 setup

You'll need to create an AWS S3 bucket, which is where the uploads will be
stored. See [this walkthrough](https://docs.aws.amazon.com/AmazonS3/latest/dev/walkthrough1.html#walkthrough1-create-bucket) on how to do that.

Next you'll need to configure CORS for that bucket, so that it accepts (multipart) uploads
directly from the client. In the AWS S3 Console go to your bucket, click on the
"Permissions" tab and then on "CORS configuration". There paste in the following:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <CORSRule>
    <AllowedOrigin>https://my-app.com</AllowedOrigin>
    <AllowedMethod>GET</AllowedMethod>
    <AllowedMethod>POST</AllowedMethod>
    <AllowedMethod>PUT</AllowedMethod>
    <MaxAgeSeconds>3000</MaxAgeSeconds>
    <AllowedHeader>Authorization</AllowedHeader>
    <AllowedHeader>x-amz-date</AllowedHeader>
    <AllowedHeader>x-amz-content-sha256</AllowedHeader>
    <AllowedHeader>content-type</AllowedHeader>
    <ExposeHeader>ETag</ExposeHeader>
  </CORSRule>
  <CORSRule>
    <AllowedOrigin>*</AllowedOrigin>
    <AllowedMethod>GET</AllowedMethod>
    <MaxAgeSeconds>3000</MaxAgeSeconds>
  </CORSRule>
</CORSConfiguration>
```

Replace `https://my-app.com` with the URL to your app (in development you can
set this to `*`). Once you've hit "Save", it may take some time for the new
CORS settings to be applied.

[Source](https://github.com/janko/uppy-s3_multipart/blob/master/README.md)

## References
* [Webpacker](https://github.com/rails/webpacker) - Manages app-like JavaScript modules in Rails
* [Shrine](https://github.com/shrinerb/shrine) - File attachment toolkit for Ruby applications
* [Devise](https://github.com/plataformatec/devise) - Flexible authentication solution for Rails based on Warden

## License
This project is licensed under the terms of the [MIT](https://choosealicense.com/licenses/mit/) license.
