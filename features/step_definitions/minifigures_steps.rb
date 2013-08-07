Given(/^the system knows about the series 11$/) do |minifigure|
  series_gateway.add_minifigure minifigure.hashes
end

When(/^the client request GET (.*)$/) do |path|
  header 'accept', 'application/json'
  get path
end

Then(/^the response should be JSON:$/) do |json|
  JSON.parse(last_response.body).should == JSON.parse(json)
end
