source :rubygems

gem 'rails', '3.1.0.rc4'
gem 'yajl-ruby', '~>0.8', require: 'yajl'
gem 'ruby-hmac', '~>0.4', require: 'hmac-sha1'

group :development, :test do
  gem 'rspec-rails', '~>2.6'
  gem 'sqlite3'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem "cucumber-rails", "0.4.1"
end

group :test do
  gem "factory_girl_rails", "1.1.beta1", :require => false
  gem 'database_cleaner', '~>0.6'
  gem 'timecop', "0.3.5"
end

group :development do
  gem "spork", "0.9.0.rc3", :require => false
  gem "guard-rspec", "0.3.0", :require => false
  gem "guard-spork", "0.1.10", :require => false
  gem "guard-cucumber", '0.3.0', :require => false
  gem "growl", "1.0.3", :require => false
  gem "guard-cucumber", '0.3.0', :require => false
  gem "rb-fsevent", "0.4.0"
end
