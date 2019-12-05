# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

require 'cucumber/rails'
require 'capybara/cucumber'
# require 'capybara'


# frozen_string_literal: true

# Capybara defaults to CSS3 selectors rather than XPath.
# If you'd prefer to use XPath, just uncomment this line and adjust any
# selectors in your step definitions to use the XPath syntax.
# Capybara.default_selector = :xpath

# By default, any exception happening in your Rails application will bubble up
# to Cucumber so that your scenario will fail. This is a different from how
# your application behaves in the production environment, where an error page will
# be rendered instead.
#
# Sometimes we want to override this default behaviour and allow Rails to rescue
# exceptions and display an error page (just like when the app is running in production).
# Typical scenarios where you want to do this is when you test your error pages.
# There are two ways to allow Rails to rescue exceptions:
#
# 1) Tag your scenario (or feature) with @allow-rescue
#
# 2) Set the value below to true. Beware that doing this globally is not
# recommended as it will mask a lot of errors for you!
#
ActionController::Base.allow_rescue = false

# Remove/comment out the lines below if your app doesn't have a database.
# For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

# You may also want to configure DatabaseCleaner to use different strategies for certain features and scenarios.
# See the DatabaseCleaner documentation for details. Example:
#
#   Before('@no-txn,@selenium,@culerity,@celerity,@javascript') do
#     # { except: [:widgets] } may not do what you expect here
#     # as Cucumber::Rails::Database.javascript_strategy overrides
#     # this setting.
#     DatabaseCleaner.strategy = :truncation
#   end
#
#   Before('not @no-txn', 'not @selenium', 'not @culerity', 'not @celerity', 'not @javascript') do
#     DatabaseCleaner.strategy = :transaction
#   end
#

# Possible values are :truncation and :transaction
# The :transaction strategy is faster, but might give you threading problems.
# See https://github.com/cucumber/cucumber-rails/blob/master/features/choose_javascript_database_strategy.feature
Cucumber::Rails::Database.javascript_strategy = :truncation

# Capybara.server = :webrick
Capybara.register_server :thin do |app, port, host|
   require 'rack/handler/thin'
   Rack::Handler::Thin.run(app, :Port => port, :Host => host)
end

Capybara.server = :thin

Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  # Enable debug mode. Prints a log of everything the driver is doing.
  config.debug = false

  # By default, requests to outside domains (anything besides localhost) will
  # result in a warning. Several methods allow you to change this behavior.

  # Silently return an empty 200 response for any requests to unknown URLs.
  # config.block_unknown_urls

  # Allow pages to make requests to any URL without issuing a warning.
  config.allow_unknown_urls
  
  # config.allow_url("code.jquery.com")
  # config.allow_url("stackpath.bootstrapcdn.com")
  # config.allow_url("cdnjs.cloudflare.com")
  # config.allow_url("cdn.datatables.net")

  # Silently return an empty 200 response for any requests to the given URL.
  # config.block_url("example.com")

  # Timeout if requests take longer than 10 seconds
  config.timeout = 10

  # Don't raise errors when SSL certificates can't be validated
  # config.ignore_ssl_errors

  # Don't load images
  config.skip_image_loading

  # Raise JavaScript errors as exceptions
  config.raise_javascript_errors = true
end