source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


#Rails version
gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
#added by hitesh
gem "pgcrypto"
gem 'turbolinks'

gem 'figaro'
gem 'puma', '~> 3.0'
gem 'jquery-rails'
gem 'listen'
gem 'redis'
gem 'sinatra', github: 'sinatra/sinatra'
gem 'sidekiq'
gem 'sass-rails'
gem 'uglifier'
gem 'slim-rails'
gem 'coffee-rails'
gem 'seedbank'
gem 'pry'

#Cells
gem 'cells'
gem 'cells-slim'

# Auth
gem 'devise', github: 'plataformatec/devise'
gem 'cancancan', '~> 1.10'

gem 'rails_admin', '~> 1.2'

# Forms - TODO: Install this fully
#gem 'simple_form', github: 'plataformatec/simple_form'

# Jquery/Javascript Libraries
#gem 'jquery-ui-rails'

#added by Hitesh
gem 'jquery-ui-rails', '~> 5.0', '>= 5.0.5'


gem 'jquery-datatables-rails'
gem 'ajax-datatables-rails'
gem 'acts_as_list'

# Assets / Visuals
gem 'bootstrap-sass'
gem 'bootstrap-modal-rails'
gem 'autoprefixer-rails', github: 'ai/autoprefixer-rails'
gem 'font-awesome-rails'
gem 'simple-line-icons-rails'
gem 'tinymce-rails'
gem 'tinymce-rails-imageupload', github: 'PerfectlyNormal/tinymce-rails-imageupload'
gem "chartkick"
gem 'kaminari', github: "amatsuda/kaminari"

# IP Address Functions
gem 'ipaddress'

# Transfer/Interaction libs
gem 'unirest'
gem 'net-ssh'
gem 'net-scp'
gem 'diplomat'
gem 'httparty'
gem 'json'
gem 'net-ping'

# Fake Data


gem 'faker'
gem 'oj'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

group :development do
  gem 'annotate'
  gem 'meta_request'
  gem 'web-console', '~> 2.0'

  gem 'capistrano'
  gem 'capistrano3-puma' , github: "seuros/capistrano-puma"
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rvm'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.6'
  gem 'byebug' # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'database_cleaner', '~> 1.4.1'
  #gem 'shoulda', require: false
  gem 'shoulda-matchers', '~> 3.1'
  gem 'fabrication'
  gem 'factory_bot_rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-rails-console'
  gem 'capistrano-sidekiq', github: 'seuros/capistrano-sidekiq'
end

  group :test do
   gem 'knock'
  end

#added by hitesh
gem 'dotenv-rails', groups: [:development, :test]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
