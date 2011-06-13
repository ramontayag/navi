# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require File.expand_path("../blueprints.rb",  __FILE__)
require "rails/test_help"
require "rspec/rails"

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_url_options[:host] = "test.com"

Rails.backtrace_cleaner.remove_silencers!

# Configure capybara for integration testing
require "capybara/rails"
Capybara.default_driver   = :rack_test
Capybara.default_selector = :css

# Run down then up any available migration in the dummy app
def migrate(direction)
  puts "Will migrate #{direction}"
  migration_directory = File.expand_path "../dummy/db/migrate", __FILE__
  migration_files = Dir["#{migration_directory}/[0-9]*_*.rb"]
  migration_files.each {|migration_file| require migration_file} # require them so we can execute them
  case direction
  when :up   : migration_files.each { |file_name| $1.camelize.constantize.up if file_name =~ /[\w\/\.]*\/\d*_(.*)\.rb$/ }
  when :down
    # Originally: migration_files.sort.reverse.each { |file_name| $1.camelize.constantize.down if file_name =~ /[\w\/\.]*\/\d*_(.*)\.rb$/ }
    # But better to just drop all tables
    ActiveRecord::Base.connection.tables.each do |table_name|
      ActiveRecord::Base.connection.execute("DROP TABLE IF EXISTS '#{table_name}'")
    end
  end
end
migrate :down
migrate :up

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  # Remove this line if you don't want RSpec's should and should_not
  # methods or matchers
  require 'rspec/expectations'
  config.include RSpec::Matchers

  # == Mock Framework
  config.mock_with :rspec
end

# Adds the *args to the klass and yields the new_klass
# Good for temporarily testing out certain arguments
def navigable(klass, *args)
  klass.class_eval do
    # navigable method here isn't actually this method,
    # it's the method in the navigable gem
    navigable *args
  end
  yield
ensure
  # Reset navigable to nothing again
  klass.navigable
end

#$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
#$LOAD_PATH.unshift(File.dirname(__FILE__))
#require 'rubygems'
#require 'active_support'
#require 'active_record'
#require 'rspec'
#require 'navi'
#require 'spec/fixtures/category'
#require 'spec/fixtures/nav_item'

##Allow to connect to SQLite
#ActiveRecord::Base.establish_connection(
  #:adapter => "sqlite3",
  #:database => ":memory:"
#)

#def reset_database
  #%W(nav_items categories pages).each do |table_name|
    #ActiveRecord::Base.connection.execute("DROP TABLE IF EXISTS '#{table_name}'")
  #end
  #ActiveRecord::Base.connection.create_table(:nav_items) do |t|
    #t.string :label
    #t.string :link
    #t.string :title
    #t.integer :parent_id, :default => 0
    #t.integer :position
    #t.string :highlights_on
    #t.integer :navigable_id
    #t.string :navigable_type
  #end
  #ActiveRecord::Base.connection.create_table(:categories) do |t|
    #t.string :name
    #t.string :nombre
  #end
  #ActiveRecord::Base.connection.create_table(:pages) do |t|
    #t.string :name
  #end
#end

## Adds the *args to the klass and yields the new_klass
## Good for temporarily testing out certain arguments
#def navigable(klass, *args)
  #klass.class_eval do
    ## navigable method here isn't actually this method,
    ## it's the method in the navigable gem
    #navigable *args
  #end
  #yield
#ensure
  ## Reset navigable to nothing again
  #klass.navigable
#end


## Requires supporting files with custom matchers and macros, etc,
## in ./support/ and its subdirectories.
#Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

#RSpec.configure do |config|
  
#end
