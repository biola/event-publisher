source 'https://rubygems.org'

gem 'rails', '4.1.7'

# Gems used only for assets and not required
# in production environments by default.
gem 'bootstrap-sass', '~> 3.1.1'
gem 'font-awesome-rails'
gem 'sass-rails',   '~> 4.0.4'
gem 'coffee-rails', '~> 4.0.1'

group :assets do
  gem 'uglifier', '>= 1.0.3'
end

gem 'biola_deploy'
gem 'biola_frontend_toolkit'
gem 'blazing'
gem 'buweb_content_models', '~> 0.22.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'kaminari-bootstrap'
gem 'mongoid', '~> 4.0'
gem 'newrelic_rpm'
gem 'pinglish'
gem 'pretender'
gem 'pundit'
gem 'rack-cas', '>= 0.12.0'
gem 'rails_config'
gem 'sidekiq'
gem 'slim', '>= 2.0.2'
gem 'therubyracer'
gem 'trogdir_api_client'
gem 'turnout'

group :development do
  gem 'better_errors'
end

group :development, :test do
  gem 'binding_of_caller'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'mongoid-rspec', github: 'biola/mongoid-rspec'
  gem 'pry'
  gem 'rspec-rails', '~> 3.0.1'
  gem 'thin'
end

group :development, :staging, :test do
  gem 'faker'
end

group :production do
  gem 'exception_notification'
end

group :test do
  gem 'capybara'
end
