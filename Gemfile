source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.0.4'

gem 'pg', '~> 1.4.6'
gem 'sqlite3'

gem 'bootstrap_form', '>= 4.2.0'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'browser'
gem 'carrierwave', '~> 1.0'
gem 'carrierwave-ftp', require: 'carrierwave/storage/ftp'
gem 'cells-erb'
gem 'cells-rails'
gem 'dalli'
gem 'delayed_cron_job'
gem 'delayed_job_active_record'
gem 'dotenv-rails'
gem 'flipper'
gem 'flipper-active_record'
gem 'fog-aws'
gem 'font-awesome-rails'
gem 'jbuilder', '~> 2.5'
gem 'kaminari'
gem 'localeapp', group: :production
gem 'matrix', '~> 0.4.2'
gem 'net-ftp'
gem 'newrelic_rpm', group: :production
gem 'puma', '>= 3.12.6'
gem 'rails-html-sanitizer', '~> 1.0'
gem 'sassc-rails'
gem 'simple_metric'
gem 'slack-notifier'
gem 'sprockets-rails'
gem 'staccato'
gem 'user-agent-randomizer', require: 'user_agent_randomizer'

group :development, :test do
  gem 'debug'
  gem 'pry-rails'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'factory_bot_rails'
  gem 'rspec-its'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'i18n-tasks', '~> 0.9.29'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'vcr'
  gem 'webmock'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
