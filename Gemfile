# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '3.0.0'
gem 'bootsnap',                     '>= 1.4.2', require: false
gem 'devise',                       '~> 4.7', '>= 4.7.1'
gem 'haml',                         '~> 5.1', '>= 5.1.2'
gem 'jbuilder',                     '~> 2.7'
gem 'pg',                           '>= 0.18', '< 2.0'
gem 'puma',                         '~> 4.3'
gem 'rails',                        '~> 6.0.2', '>= 6.0.2.2'
gem 'rubocop-rails', require: false
gem 'sass-rails',                   '>= 6'
gem 'turbolinks',                   '~> 5'
gem 'webpacker',                    '~> 4.0'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker',                      '~> 2.18'
  gem 'pry-rails'
  gem 'rspec-rails',                '~> 4.0.0'
end

group :development do
  gem 'listen',                     '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen',      '~> 2.0.0'
  gem 'web-console',                '>= 3.3.0'
end

group :test do
  gem 'capybara',                   '>= 2.15'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers',           '~> 5.0'
  gem 'simplecov',                  '~> 0.21.2'
  gem 'test-prof',                  '~> 1.0', '>= 1.0.6'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
