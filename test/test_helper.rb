require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Check that there is no pending migration, if so alert and halt
  ActiveRecord::Migration.check_pending!

  include FactoryGirl::Syntax::Methods
end
