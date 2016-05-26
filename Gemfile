source 'https://rubygems.org'

ruby '2.3.0'
gem 'rails', '>= 5.0.0.rc1', '< 5.1'
gem 'puma', '3.4.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'bootstrap-sass', '~> 3.3.6'

gem 'jquery-rails', '4.1.1'
gem 'jbuilder', '~> 2.0'
gem 'redis', '~> 3.0'

gem 'devise', git: 'https://github.com/plataformatec/devise.git'
gem 'dotenv', '~> 2.1', '>= 2.1.1'

group :development, :test do
  gem 'byebug'
  gem 'sqlite3'
  gem 'rspec-rails', '~> 3.1.0'
  gem 'factory_girl_rails', '~> 4.6'
end

group :test do
  gem 'faker', '~> 1.6', '>= 1.6.3'
  gem 'capybara', git: 'https://github.com/jnicklas/capybara'
  gem 'database_cleaner', '~> 1.5', '>= 1.5.1'
  gem 'launchy', '~> 2.4', '>= 2.4.3'
  gem 'selenium-webdriver', '~> 2.52'
  gem 'rails-controller-testing', '~> 0.1.1'
end

group :development do
  gem 'web-console', '~> 3.0'
  gem 'spring', '1.7.1'
end

group :production do
  gem 'pg', '0.18.4'
  gem 'rails_12factor', '0.0.3'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
