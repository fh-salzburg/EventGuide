source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3'

gem 'cocaine'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

#jquery and fancybox
gem 'jquery-rails'
gem 'fancybox-rails'

#paperclip for upload images
gem 'paperclip'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'
gem "bcrypt-ruby", :require => "bcrypt"

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

# bspw. sqlite in development und test
group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'win32console'
end

# und mysql in Production
group :production do
  gem 'mysql2'
end
