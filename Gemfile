source 'https://rubygems.org'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'

gem 'monban'

gem 'monban-generators'

#use gon for passing variables
gem 'gon'
gem 'note_frequencies'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
# gem "rspec-rails", "~> 2.14.0"
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
#css normalize
gem 'activesupport'
# for aws cloud storage
gem 'fog'
# photo resizing
gem 'mini_magick'
# file upload solution
gem 'carrierwave'
gem 'figaro'
gem 'faker'
gem 'image_suckr'

group :doc do
  gem 'sdoc', '~> 0.4.0'
end

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
group :development do
	gem 'spring'
end

group :production do
	gem 'rails_12factor' 
	gem 'coveralls', require: false
	gem 'travis'
	gem 'pry'
	gem 'capybara'
	gem 'launchy'
	gem 'byebug'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'


# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development, :test do
 gem 'rspec-rails', '~> 2.14.1'
 gem 'database_cleaner', '~> 1.2.0'
 gem 'shoulda-matchers'
end

