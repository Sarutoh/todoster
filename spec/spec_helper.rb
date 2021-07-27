# frozen_string_literal: true

require 'simplecov'

SimpleCov.start

require File.expand_path('../config/environment', __dir__)
require 'rails/all'
require 'rspec/rails'
require 'devise'
require 'test_prof/recipes/rspec/let_it_be'
require 'test_prof/recipes/rspec/before_all'
require 'test_prof/recipes/rspec/factory_default'

RSpec.configure do |config|
  SimpleCov.minimum_coverage 100

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
