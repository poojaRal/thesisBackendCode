source 'https://rubygems.org'

# declare ruby version, heroku suggested
ruby '2.1.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# User authentication
gem 'devise'

# Use mysql as the database for Active Record
gem 'mysql2'

# Use SCSS for stylesheets
gem 'sprockets', '2.11.0'
gem 'sass-rails', '>= 4.0.0'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'will_paginate-bootstrap'
gem 'momentjs-rails', '~> 2.5.0'
gem 'bootstrap3-datetimepicker-rails', '~> 3.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

#
gem 'jquery-turbolinks'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Rails model reverse engineering
gem 'rmre'

# Easier rails csv files
gem 'csv_shaper'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# running cron jobs for scheduled tasks easily
gem 'rufus-scheduler'

# Unicorn http server to deploy onto
gem 'unicorn'

# "Needed" with the heroku/unicorn server to support timeouts
gem 'rack-timeout'

# needed to bypass cors errors
gem 'rack-cors', :require => 'rack/cors'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
