source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.0'
gem 'jquery-rails'
#gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'cancan'
gem 'haml-rails'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'pg'
gem 'rolify'
gem 'simple_form', '>= 3.0.0.rc'
gem 'carrierwave'
gem 'noisia', :git=>'https://github.com/unloved/noisia'
gem 'active_link_to'

#group :assets, :development do
 gem 'bootstrap-sass', :git => 'git://github.com/thomas-mcdonald/bootstrap-sass.git' # '~> 2.3.2.0'
 gem 'coffee-rails', '~> 4.0.0'
 gem "jquery-fileupload-rails", :git=>'git://github.com/beedub/jquery-fileupload-rails.git'
 gem 'quiet_assets'
 gem 'sass-rails', '~> 4.0.0'
 gem 'uglifier', '>= 1.3.0'
 gem 'compass-rails', '~> 2.0.alpha.0'
 gem 'animate-sass'
#end

group :development do
  gem 'html2haml'
  gem 'rails_layout'
  gem 'pry-rails'
  gem 'pry-theme'

  gem 'pry-pretty-numeric'
  gem 'pry-syntax-hacks'
  gem 'pry-highlight'
  gem 'pry-git'
  gem 'pry-developer_tools'

  gem 'pry-remote'

# step, next, finish, continue, break
  gem 'pry-nav'
  gem 'pry-doc'
  gem 'pry-docmore'

# Добавляет show-stack
  gem "pry-stack_explorer"

end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'thin'
end
group :production do
  gem 'unicorn'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
end

group :deploy do
    gem 'capistrano', '~> 3.0', :require => false
    gem 'capistrano-rbenv', github: 'capistrano/rbenv', :require => false
    gem 'capistrano-rails', github: 'capistrano/rails', :require => false
    gem 'capistrano-bundler', github: 'capistrano/bundler', :require => false
end
