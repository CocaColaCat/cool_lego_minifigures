require 'webmachine'
require 'webmachine/adapters/rack'
require 'json'
require 'mongoid'
require 'mongo'
require 'tilt'
require 'haml'
require_relative './resources/series_resource'
require_relative './models/minifigure'

TEMPLATES_DIR = File.join(File.expand_path('../../', __FILE__), 'templates')

MinifiguresApp = Webmachine::Application.new do |app|
  app.configure do |config|
    config.adapter = :Rack
  end

  app.routes do 
    add ['series', :series_number], SeriesResource
  end
end
