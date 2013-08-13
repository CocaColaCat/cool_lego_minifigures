Given(/^the system knows the following:$/) do |minifigures|
  minifigures.hashes.each do |m|
    Minifigure.create(m)
  end
end

When(/^client adds the following minifigure:$/) do |minifigure|
  teller.add_minifigure(minifigure.hashes)
end

Then(/^the system should contain the following:$/) do |expected_results|
  expected_results.hashes.each do |r|
    page.should have_content(r['name'])
  end
end
