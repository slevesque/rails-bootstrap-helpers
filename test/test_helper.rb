require 'minitest'
require 'minitest/autorun'
require 'rails/all'
require 'rails-bootstrap-helpers'
require 'erb'

# ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

# load File.join(File.dirname(__FILE__), "schema.rb")

# Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

class TestBase < MiniTest::Test
  include ActionView::Context
  include ActionView::Helpers::TagHelper
  include RailsBootstrapHelpers::Helpers::BaseHelper
end
