require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/vat_id_validator/version'
end

require 'vat_id_validator'
require 'support/active_model_test_class'

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include VatIdValidator::Matchers

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
