source 'https://rubygems.org'


ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# Use Puma as the app server
#gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Use Haml as the templating library
gem 'haml'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Shrine to upload files
gem "shrine", "~> 3.0"
gem "fastimage"                     # analyze image dimensions
gem "image_processing", "~> 1.8"
gem "marcel", "~> 0.3"              # extract MIME type from file content 
gem "aws-sdk-s3", "~> 1.14"         # for AWS S3 storage
gem "uppy-s3_multipart", "~> 0.3"   # resumable direct upload
gem 'mini_mime'
# USEFUL SHRINE LINKS:
# https://shrinerb.com/docs/getting-started

# Used for handling datatable AJAX requests
gem 'will_paginate'

# Handles User Authentication
gem 'devise', '~> 4.2'

# Converts time to user's on client-side
gem 'local_time'

# Makes setting configs easier
gem 'figaro', '~> 1.1', '>= 1.1.1'
# Gives Text Area boxes WYSYWIG toolbar 
gem 'tinymce-rails'
gem 'bootstrap-wysihtml5-rails', '~> 0.3.3.8'
# Gives calendar
gem 'american_date'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  
  gem 'factory_bot_rails'
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
  
  #gem 'rspec-rails'
  gem 'rspec-core', git: 'https://github.com/rspec/rspec-core'
  gem 'rspec-expectations', git: 'https://github.com/rspec/rspec-expectations'
  gem 'rspec-mocks', git: 'https://github.com/rspec/rspec-mocks'
  gem 'rspec-rails', git: 'https://github.com/rspec/rspec-rails'
  gem 'rspec-support', git: 'https://github.com/rspec/rspec-support'
  
  #gem 'guard-rspec'
  gem 'cucumber-rails', require: false
  # gem 'puma'
  gem 'capybara'
  gem 'capybara-webkit', git: 'https://github.com/thoughtbot/capybara-webkit.git'
  gem 'database_cleaner'
  
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.4' 
  
  # Used to verify emails sent from devise
  # Run with : mailcatcher --http-port 8081 --http-ip $IP --smtp-port 1025 --smtp-ip $IP
  gem 'mailcatcher'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg', '~> 0.21' # for Heroku deployment
  gem 'rails_12factor'
  gem 'puma'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
