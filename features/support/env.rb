require File.join(File.expand_path('../../../', __FILE__), 'lib', 'minifigures_app')
require 'rack/test'

module AppHelper
  def app
    MinifiguresApp.adapter
  end
end

World(Rack::Test::Methods, AppHelper)
