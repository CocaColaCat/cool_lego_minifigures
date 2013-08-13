require 'webmachine'
require 'webmachine/adapters/rack'
require 'json'
require 'mongoid'
require 'mongo'
require 'tilt'
require 'haml'

TEMPLATES_DIR = File.join(File.expand_path('../../', __FILE__), 'templates')

class SeriesResource < Webmachine::Resource
  def allowed_methods
    ['GET', 'POST']
  end

  def content_types_provided
    [['application/json', :to_json], ['text/html', :to_html]]
  end

  def to_json
    json = []
    Minifigure.all.each {|m| json << {name: m.name}}
    json.to_json
  end

  def to_html
    template = Tilt::HamlTemplate.new (TEMPLATES_DIR + '/minifigures.haml')
    template.render Object.new, {minifigures: Minifigure.all}
  end

  def content_types_accepted
    [['application/x-www-form-urlencoded', :from_form]]
  end

  def post_is_create?
    true
  end

  def from_form
    form = Hash[URI.decode_www_form(request.body.to_s)]
    Minifigure.create(name: form['minifigure_name'])
    template = Tilt::HamlTemplate.new (TEMPLATES_DIR + '/minifigures.haml')
    response.body = template.render Object.new, {minifigures: Minifigure.all}
  end

  def create_path
    "any"
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
