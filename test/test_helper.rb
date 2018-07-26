require 'rubygems'
require 'bundler'
require 'test/unit'
require 'rails/all'
require 'rails-bootstrap-helpers'
# require 'erb'

# ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

# load File.join(File.dirname(__FILE__), "schema.rb")

# Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

class Test::Unit::TestCase
  include ActionView::Context
  include ActionView::Helpers::TagHelper
  include RailsBootstrapHelpers::Helpers::BaseHelper
  include RailsBootstrapHelpers::Helpers::ButtonHelper
end
