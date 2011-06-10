require 'rubygems'
require 'spork'

Spork.prefork do
  require 'cucumber/rails'
end

Spork.each_run do
  ActionController::Base.allow_rescue = false
  DatabaseCleaner.strategy = :transaction

  require 'factory_girl_rails'
end
