# frozen_string_literal: true

require 'simplecov'

SimpleCov.start

require 'capybara/rspec'
require 'capybara/cuprite'
require 'rack_session_access/capybara'

Capybara.javascript_driver = :cuprite
Capybara.register_driver(:cuprite) do |app|
  Capybara::Cuprite::Driver.new(app, window_size: [1200, 800])
end
Capybara.server = :puma, { Silent: true }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
