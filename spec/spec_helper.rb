# coding: utf-8
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require "rack"
require "rack/test"
require "rack/ltsvlogger"
require "rspec"
require "rspec/autorun"

class FakeApp
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["Hello"]]
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

