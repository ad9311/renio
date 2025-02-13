# frozen_string_literal: true

source 'https://rubygems.org'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 8.0.1'
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem 'propshaft'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'
# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem 'jsbundling-rails'
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'
# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem 'cssbundling-rails'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Use the database-backed adapters for Rails.cache and Active Job
gem 'solid_cache'
gem 'solid_queue'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem 'kamal', require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem 'thruster', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Devise for authentication [https://github.com/heartcombo/devise]
gem 'devise', '~> 4.9'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem 'brakeman', require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem 'rubocop-rails-omakase', require: false

  # RSpec for testing [https://rspec.info/]
  gem 'rspec-rails', '~> 7.1'

  # FactoryBot for testing [https://github.com/thoughtbot/factory_bot]
  gem 'factory_bot_rails', '~> 6.4'

  # Faker for testing [https://github.com/faker-ruby/faker]
  gem 'faker', '~> 3.5'

  # Pry for debugging [https://github.com/pry/pry]
  gem 'pry', '~> 0.15.2'

  # Rubocop for Rails [https://github.com/rubocop/rubocop-rails]
  gem 'rubocop-rails', '~> 2.29'

  # Rubocop for RSpec [https://github.com/rubocop/rubocop-rspec]
  gem 'rubocop-rspec', '~> 3.4'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add annotations to your models [https://github.com/drwl/annotaterb]
  gem 'annotaterb', '~> 4.13'

  # Dockerize your Rails application [https://github.com/rails/dockerfile-rails]
  gem 'dockerfile-rails', '>= 1.7'
end
