source 'https://rubygems.org'

ruby '2.2.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use pg as the database for Active Record
gem 'pg'
gem 'haml'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
gem 'compass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
gem 'simple_form'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-rails-cdn'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Puma as the app server
gem 'puma'


group :development do

  gem 'awesome_print', require: 'ap'

  #HAML scaffolds
  gem 'haml-rails'

  #Debugging tools
  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'letter_opener'
  gem 'letter_opener_web'
end

group :production, :staging do
  # New Relic App Monitoring
  gem 'newrelic_rpm'
  gem 'rails_12factor'
end

#For markdown parsing
gem 'bluecloth'

#Authentication
gem 'devise'

#For Memcachier
gem 'memcachier'
gem 'dalli'