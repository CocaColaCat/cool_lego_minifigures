require 'webmachine'
require 'webmachine/adapters/rack'
require 'json'
require_relative 'mongodb_connector'
require_relative 'series_gateway'

class Series < Webmachine::Resource
  def content_types_provided
    [['application/json', :to_json]]
  end

  def to_json
    SeriesGateway.new('test', 'test').get_minifigures.to_json
  end
end

MinifiguresApp = Webmachine::Application.new do |app|
                 app.configure do |config|
		   config.adapter = :Rack
		 end

		 app.routes do 
		   add ['series', :series_number], Series
		 end
end

