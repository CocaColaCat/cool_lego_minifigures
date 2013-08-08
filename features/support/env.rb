require File.join(File.expand_path('../../../', __FILE__), 'lib', 'minifigures_app')
require 'rack/test'
require 'simplecov'
SimpleCov.start

module AppHelper
  def app
    MinifiguresApp.adapter
  end
end

World(Rack::Test::Methods, AppHelper)
