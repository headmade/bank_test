require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'spec_helper.rb'

Capybara.default_driver = :selenium
Capybara.app_host = "http://localhost:8000"

RSpec.configure do |config|
  config.include Capybara::DSL
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
