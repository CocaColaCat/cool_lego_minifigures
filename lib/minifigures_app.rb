require 'webmachine'
require 'webmachine/adapters/rack'
require 'json'
require 'mongoid'
require 'mongo'

class SeriesResource < Webmachine::Resource
  def content_types_provided
    [['application/json', :to_json]]
  end

  def to_json
    json = []
    Minifigure.all.each {|m| json << {name: m.name}}
    json.to_json
  end
end

class Minifigure
  include Mongoid::Document
  field :name, type: String
end

MinifiguresApp = Webmachine::Application.new do |app|
                 app.configure do |config|
		   config.adapter = :Rack
		 end

		 app.routes do 
		   add ['series', :series_number], SeriesResource
		 end
end
Mongoid.load!("./config/mongoid.yml", :development)
