require File.join(File.expand_path('../../../', __FILE__), 'lib', 'minifigures_app')
require 'rack/test'
require 'simplecov'
require 'capybara/cucumber'
SimpleCov.start

Mongoid.load!("./config/mongoid.yml", :development)

Capybara.app = MinifiguresApp.adapter
module AppHelper
  def app
    MinifiguresApp.adapter
  end
end

World(Rack::Test::Methods, AppHelper)
