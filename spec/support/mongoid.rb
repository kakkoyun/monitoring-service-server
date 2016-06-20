ENV["RAILS_ENV"] ||= 'test'

require 'rails/mongoid'
require 'mongoid'
require 'mongoid-rspec'
require 'database_cleaner'
require 'pathname'

rails_root = Pathname.new('../..').expand_path(File.dirname(__FILE__))
Mongoid.load!(rails_root.join("config", "mongoid.yml"))

RSpec.configure do |config|
  config.include Mongoid::Matchers, type: :model

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.orm = "mongoid"
  end

  config.before(:each) do
    DatabaseCleaner[:mongoid].start
  end

  config.after(:each) do
    DatabaseCleaner[:mongoid].clean
  end
end
