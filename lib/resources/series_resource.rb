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
    response.body = to_html
  end 

  def create_path
    "any"
  end
 
end
