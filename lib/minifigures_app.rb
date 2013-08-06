require 'webmachine'
require 'webmachine/adapters/rack'

class DataStore 
  def self.minifigures=(data)
    @@minifigures = data
  end
  
  def self.minifigures
    @@minifigures
  end
end


class Series < Webmachine::Resource
  def content_types_provided
    [['application/json', :to_json]]
  end

  def to_json
    DataStore.minifigures.to_json
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

