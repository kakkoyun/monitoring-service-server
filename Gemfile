source 'https://rubygems.org'

# Fundamental
gem 'rails', '4.2.6'

# Persistence Layer
gem 'mongoid', '5.1.3'

# Security, Authentication and Authorization
gem 'devise', '~> 4.1'
gem 'doorkeeper', '~> 3.0'
gem 'doorkeeper-mongodb', github: 'doorkeeper-gem/doorkeeper-mongodb' # Initial: 3.0.0

# Controller
gem 'responders', '~> 2.2'

# Frontend
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails', '~> 3.1'
gem 'turbolinks', '~> 2.5'
gem 'jquery-turbolinks', '~> 2.1'
gem 'toastr-rails', '~> 1.0'
gem 'tabs_on_rails', '~> 2.2'

# Style
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap-sass', '~> 3.3'

# JSON Serialization
gem 'oj', '~> 2.12'
gem 'jbuilder', '~> 2.5'

# Forms
gem 'simple_form', '~> 3.2'

# API Documentation
gem 'apipie-rails'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.0'
end

group :development, :test do
  gem 'byebug'
  gem 'pry-byebug'
  gem 'pry-rails'

  # Testing Core
  gem 'rspec-rails', '~> 3.4'
  gem 'factory_girl_rails', '~> 4.7'
end

group :test do
  # Testing Utils
  gem 'mongoid-rspec', '3.0.0'
  gem 'capybara', '~> 2.7'
  gem 'poltergeist', '~> 1.9'
  gem 'launchy', '~> 2.4'
  gem 'guard-rspec', '~> 4.7'
  gem 'database_cleaner', '~> 1.5'
  gem 'faker', git: 'git@github.com:stympy/faker.git'
end

group :development do
  gem 'spring'
  gem 'thin'

  # Debugging
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'

  # RubyMine Debugger
  gem 'debase'
  gem 'ruby-debug-ide'

  # Helpers
  gem 'did_you_mean', '~> 0.10'
  gem 'quiet_assets' # Mute asset-pipeline logs.
  gem 'rb-fsevent'

  # Dependency management
  gem 'bundler-audit'

  # Profiling
  gem 'ruby-prof'

  # Security
  gem 'brakeman'

  # Code Metrics
  gem 'metric_fu'

  # Documenting
  gem 'annotate'

  # Deployment
  gem "capistrano"
  gem "capistrano-rbenv"
  gem "capistrano-bundler"
  gem 'capistrano-passenger'
end

group :production do
  gem 'passenger'
end
