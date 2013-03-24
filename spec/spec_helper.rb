# encoding: utf-8

require 'devtools/spec_helper'

$: << File.join(TestApp.root,'lib')
require 'test_app'

if ENV['COVERAGE'] == 'true'
  require 'simplecov'
  require 'coveralls'

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]

  SimpleCov.start do
    command_name     'spec:unit'
    add_filter       'config'
    add_filter       'spec'
    add_filter       'test_app'
    minimum_coverage 81.87
  end
end

require 'mutant'

RSpec.configure do |config|
  config.include(CompressHelper)
end
