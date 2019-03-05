require "bundler/setup"
Bundler.setup

require "byebug"

ENV["RAILS_ENV"] ||= 'test'

require 'rails'
require 'rails_helper'
#require File.expand_path("../../config/environments/", __FILE__)
#require_relative '../config/environments'
#require 'rspec/rails'
require "rails-bootstrap-helpers"

#require 'rspec/autorun'

RSpec.configure do |config|
  #config.infer_spec_type_from_file_location!

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  # Raise deprecations
  config.raise_errors_for_deprecations!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
