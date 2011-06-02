$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rubygems'
require 'active_support'
require 'active_record'
require 'rspec'
require 'navigable'

#Allow to connect to SQLite
root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
Dir.mkdir("db") unless File.directory?("db")
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => ":memory:"
)

def reset_database
  %W(nav_items categories).each do |table_name|
    ActiveRecord::Base.connection.execute("DROP TABLE IF EXISTS '#{table_name}'")
  end
  ActiveRecord::Base.connection.create_table(:nav_items) do |t|
    t.string :label
    t.string :link
    t.string :title
    t.integer :parent_id
    t.integer :position
    t.string :highlights_on
    t.integer :navigable_id
    t.string :navigable_type
  end
  ActiveRecord::Base.connection.create_table(:categories) do |t|
    t.string :name
    t.string :nombre
  end
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


# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  
end
