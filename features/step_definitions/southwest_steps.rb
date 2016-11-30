require 'page-object'
include PageObject::PageFactory

When(/^I search for a flight using the default dates$/) do
  visit_page(SouthwestHome) do |page|
    page.departure_city= 'cmh'
    page.arrival_city= 'bna'
    page.search_flights
    sleep 5
  end
end

Then(/^the dates I searched for are highlighted in the search results$/) do
  on_page(SouthwestHome) do |page|
    time = Time.new
    departure_date = Time.new + 60*60*24
    arrival_date = Time.new + 60*60*96

    # highlighted departure date is tomorrows date
    expect(page.flight_dates_elements[0].attribute('carouselfulldate')).to eq departure_date.strftime('%Y/%m/%d')
    # highlighted return date is 3 days from departure date
    expect(page.flight_dates_elements[1].attribute('carouselfulldate')).to eq arrival_date.strftime('%Y/%m/%d')
  end
end

And(/^I can't choose a departure date from the past$/) do
  on_page(SouthwestHome) do |page|
    time = Time.new

    # first enabled date should be todays date
    expect(page.first_enabled_date).to include time.strftime('%d')
  end
end