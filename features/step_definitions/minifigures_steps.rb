Given(/^the system knows about the series 11$/) do |minifigure|
  minifigure.hashes.each do |m|
    Minifigure.create(m)
  end
end

When(/^the client request GET (.*)$/) do |path|
  header 'accept', 'application/json'
  get path
end

Then(/^the response should be JSON:$/) do |json|
  JSON.parse(last_response.body).should == JSON.parse(json)
end
