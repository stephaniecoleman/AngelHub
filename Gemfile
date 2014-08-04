source 'https://rubygems.org'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
# Octokit is a Ruby toolkit for the GitHub API
gem 'octokit', "~> 3.0"
# user authentication
gem 'devise'
# organize application secrets and api keys.
# Read more: https://github.com/laserlemon/figaro
gem 'figaro'

# role based authorization gem
# Read:
#  https://github.com/CanCanCommunity/cancancan
#  https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
gem 'cancancan', '~> 1.9'

# use omniauth protocol to sign in developers
# Read:
#  https://github.com/intridea/omniauth
#  https://github.com/intridea/omniauth-github
#  https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
gem 'omniauth'
gem 'omniauth-github'

# CarrierWave for File Uploads
# https://github.com/carrierwaveuploader/carrierwave
gem 'carrierwave'

# explain please
gem 'mini_magick'

# simplifies complicated sql querries
# https://github.com/camertron/arel-helpers
gem 'arel-helpers'

# faye for messaging
gem 'faye-rails'
# eventmachine for realtime
gem 'eventmachine'

#12 factor for assets in production
gem 'rails_12factor'

# Moved out of test-dev so can play with seeding in deployment:

# A library for setting up Ruby/ActiveRecord objects as test data
  # Read:
  #   https://github.com/thoughtbot/factory_girl
  #   http://rubydoc.info/gems/factory_girl/file/GETTING_STARTED.md
  gem 'factory_girl_rails'

  # a library that generates random data
  # https://github.com/stympy/faker
  gem 'faker'

group :test, :development do
  gem 'rspec'
  gem 'rspec-rails', '3.0.1'
  gem 'better_errors'
  gem 'pry'
  gem 'capybara'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  gem 'binding_of_caller'



  # data visualization for our database
  # Read: https://github.com/preston/railroady
  # before use:
  #     'mkdir doc' from root directory
  #     run 'brew install graphviz'
  #     rake diagram:all                        # Generates all class diagrams
  #     rake diagram:controllers:brief          # Generates an abbreviated class diagram for all controllers
  #     rake diagram:controllers:complete       # Generates an class diagram for all controllers
  #     rake diagram:models:brief               # Generates an abbreviated class diagram for all models
  #     rake diagram:models:complete            # Generates an class diagram for all models
  # /doc/* is in .gitignore so your diagrams wont be commited
  gem 'railroady'
end


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
